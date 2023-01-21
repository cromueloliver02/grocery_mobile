import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/services/services.dart';
import '../models/models.dart';
import '../../utils/utils.dart';

class WishlistService {
  final FirebaseFirestore firestore;
  final ProductService productService;
  final UserService userService;

  WishlistService({
    required this.firestore,
    required this.productService,
    required this.userService,
  });

  Future<List<DocumentSnapshot>> fetchWishlistItems(String userId) async {
    try {
      final DocumentSnapshot userDoc = await userService.getUser(userId);

      final List<String> productIds = List<String>.from(userDoc.get(kWishlist));

      final List<DocumentSnapshot> productDocs = [];

      for (final productId in productIds) {
        final DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        if (productDoc.exists) {
          productDocs.insert(0, productDoc);
        }
      }

      return productDocs;
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> addToWishlist({
    required String userId,
    required String productId,
  }) async {
    try {
      final DocumentReference userRef =
          firestore.collection(kUsersCollectionPath).doc(userId);

      await userRef.update({
        kWishlist: FieldValue.arrayUnion([productId]),
      });
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
  }) async {
    try {
      final DocumentReference userRef =
          firestore.collection(kUsersCollectionPath).doc(userId);

      await userRef.update({
        kWishlist: FieldValue.arrayRemove([productId]),
      });
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> clearWishlist(String userId) async {
    try {
      final DocumentReference userRef =
          firestore.collection(kUsersCollectionPath).doc(userId);

      await userRef.update({kWishlist: []});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
