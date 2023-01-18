abstract class BaseWishlistRepository {
  Future<void> addToWishlist({
    required String userId,
    required String productId,
  });

  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
  });
}
