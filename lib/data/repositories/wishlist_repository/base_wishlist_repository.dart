import '../../models/models.dart';

abstract class BaseWishlistRepository {
  Future<List<Product>> fetchWishlistItems(String userId);

  Future<void> addToWishlist({
    required String userId,
    required String productId,
  });

  Future<void> removeFromWishlist({
    required String userId,
    required String productId,
  });

  Future<void> clearWishlist(String userId);
}
