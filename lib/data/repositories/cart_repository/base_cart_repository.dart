import '../../models/models.dart';

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

  Future<void> incrementCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  });

  Future<void> decrementCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  });

  Future<void> updateCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  });

  Future<void> clearCart(String userId);
}
