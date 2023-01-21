import 'package:grocery_mobile/utils/enums.dart';

import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<Cart> getCart(String userId);

  Future<CartItem> addToCart({
    required String userId,
    required CartItem cartItem,
  });

  Future<void> removeFromCart({
    required String userId,
    required String cartItemId,
  });

  Future<void> changeCartItemQty({
    required String userId,
    required String cartItemId,
    required CartItemQtyAction action,
  });

  Future<void> updateCartItemQty({
    required String userId,
    required String cartItemId,
    required int newQuantity,
  });

  Future<void> clearCart(String userId);
}
