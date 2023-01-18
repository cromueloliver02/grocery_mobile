import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/services/services.dart';
import '../models/models.dart';
import '../../utils/utils.dart';

class WishlistService {
  final FirebaseFirestore firestore;
  final ProductService productService;

  WishlistService({
    required this.firestore,
    required this.productService,
  });

  Future<List<DocumentSnapshot>> fetchWishlistItems(String userId) async {
    try {
      final DocumentSnapshot userDoc =
          await firestore.collection(kUsersCollectionPath).doc(userId).get();

      final List<String> productIds = List<String>.from(userDoc.get(kWishlist));

      final List<DocumentSnapshot> productDocs = [];

      for (final productId in productIds) {
        final DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        productDocs.insert(0, productDoc);
      }

      return productDocs;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
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
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
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
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
