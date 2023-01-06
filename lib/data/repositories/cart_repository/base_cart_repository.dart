import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<void> addToCart(CartItem cartItem);
}
