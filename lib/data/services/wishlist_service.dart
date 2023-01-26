import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class WishlistService {
  final FirebaseFirestore firestore;

  WishlistService({
    required this.firestore,
  });

  Stream<List<Map<String, dynamic>>> fetchWishlistItems(String userId) async* {
    try {
      final Stream<DocumentSnapshot> userDocStream = FirebaseFirestore.instance
          .collection(kUsersCollectionPath)
          .doc(userId)
          .snapshots();

      await for (final DocumentSnapshot userDoc in userDocStream) {
        final wishlistItemMaps =
            List<Map<String, dynamic>>.from(userDoc.get(kWishlist));

        yield wishlistItemMaps;
      }
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
    required List<WishlistItem> newWishlistItems,
  }) async {
    try {
      final List<Map<String, dynamic>> wishlistItemMaps =
          newWishlistItems.map((WishlistItem d) => d.toMap()).toList();

      await firestore
          .collection(kUsersCollectionPath)
          .doc(userId)
          .update({kWishlist: wishlistItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
    required List<WishlistItem> wishlistItems,
  }) async {
    try {
      final List<WishlistItem> newWishlistItems = wishlistItems
          .where((WishlistItem d) => d.product.id != productId)
          .toList();

      final List<Map<String, dynamic>> wishlistItemMaps =
          newWishlistItems.map((WishlistItem d) => d.toMap()).toList();

      await firestore
          .collection(kUsersCollectionPath)
          .doc(userId)
          .update({kWishlist: wishlistItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> clearWishlist(String userId) async {
    try {
      await firestore
          .collection(kUsersCollectionPath)
          .doc(userId)
          .update({kWishlist: []});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
