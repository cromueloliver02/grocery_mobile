import '../../models/models.dart';
import '../../../utils/utils.dart';

abstract class BaseCartRepository {
  Stream<Cart> getCart(String userId);

  Future<void> addToCart({
    required String userId,
    required List<CartItem> newCartItems,
  });

  Future<void> removeFromCart({
    required String userId,
    required List<CartItem> newCartItems,
  });

  // TODO: to be deleted
  Future<void> changeCartItemQty({
    required String cartItemId,
    required Cart cart,
    required CartItemQtyAction action,
  });

  Future<void> incrementCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  });

  Future<void> updateCartItemQty({
    required String cartItemId,
    required Cart cart,
    required int newQuantity,
  });

  Future<void> clearCart(Cart cart);
}
