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
  Future<Wishlist> getWishlist(String userId) async {
    try {
      final List<DocumentSnapshot> wishlistItemDocs =
          await wishlistService.fetchWishlistItems(userId);

      final List<Product> wishlistItems =
          wishlistItemDocs.map((doc) => Product.fromDoc(doc)).toList();

      final Wishlist wishlist = Wishlist(wishlistItems: wishlistItems);

      return wishlist;
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
      await wishlistService.addToWishlist(
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
      await wishlistService.removeFromWishlist(
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
      await wishlistService.clearWishlist(userId);
    } catch (err) {
      rethrow;
    }
  }
}
