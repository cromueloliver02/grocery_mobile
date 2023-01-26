import '../../models/models.dart';

abstract class BaseWishlistRepository {
  Stream<Wishlist> getWishlist(String userId);

  Future<void> addToWishlist({
    required String userId,
    required List<WishlistItem> newWishlistItems,
  });

  Future<void> removeFromWishlist({
    required String userId,
    required List<WishlistItem> newWishlistItems,
  });

  Future<void> clearWishlist(String userId);
}
