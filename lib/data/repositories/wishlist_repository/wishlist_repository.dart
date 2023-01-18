import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../models/models.dart';
import './base_wishlist_repository.dart';

class WishlistRepository extends BaseWishlistRepository {
  final WishlistService wishlistService;

  WishlistRepository({
    required this.wishlistService,
  });

  @override
  Future<List<Product>> fetchWishlistItems(String userId) async {
    try {
      final List<DocumentSnapshot> productDocs =
          await wishlistService.fetchWishlistItems(userId);

      final List<Product> wishlistItems =
          productDocs.map((doc) => Product.fromDoc(doc)).toList();

      return wishlistItems;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> addToWishlist({
    required String userId,
    required String productId,
  }) async {
    try {
      return await wishlistService.addToWishlist(
        userId: userId,
        productId: productId,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
  }) async {
    try {
      return await wishlistService.removeFromWishlist(
        userId: userId,
        productId: productId,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> clearWishlist(String userId) async {
    try {
      return await wishlistService.clearWishlist(userId);
    } catch (err) {
      rethrow;
    }
  }
}
