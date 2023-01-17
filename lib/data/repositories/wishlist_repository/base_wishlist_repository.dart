abstract class BaseWishlistRepository {
  Future<void> addToWishlist({
    required String userId,
    required String productId,
  });
}
