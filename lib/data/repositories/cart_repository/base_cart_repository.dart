import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<List<CartItem>> fetchCartItems(String userId);

  Future<void> addToCart(CartItem cartItem);
}
