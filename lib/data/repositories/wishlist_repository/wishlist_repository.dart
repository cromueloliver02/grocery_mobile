import '../../../data/services/services.dart';

import './base_wishlist_repository.dart';

class WishlistRepository extends BaseWishlistRepository {
  final WishlistService wishlistService;

  WishlistRepository({
    required this.wishlistService,
  });

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
}
