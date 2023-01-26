import '../../models/models.dart';

abstract class BaseWishlistRepository {
  Stream<Wishlist> getWishlist(String userId);

  Future<void> addToWishlist({
    required String userId,
    required Product product,
    required List<WishlistItem> wishlistItems,
  });

  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
    required List<WishlistItem> wishlistItems,
  });

  Future<void> clearWishlist(String userId);
}
