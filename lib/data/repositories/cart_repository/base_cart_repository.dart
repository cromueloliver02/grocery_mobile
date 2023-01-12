import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<List<CartItem>> fetchCartItems(String userId);

  Future<CartItem> addToCart({
    required String userId,
    required CartItem cartItem,
  });

  Future<void> incrementCartItem({
    required String userId,
    required String cartItemId,
  });
}
