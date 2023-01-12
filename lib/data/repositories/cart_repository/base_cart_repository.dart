import 'package:grocery_mobile/utils/enums.dart';

import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<List<CartItem>> fetchCartItems(String userId);

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
}
