import '../../models/models.dart';

abstract class BaseCartRepository {
  Future<List<CartItem>> fetchCartItems(String userId);

  Future<CartItem> addToCart({
    required String userId,
    required CartItem cartItem,
  });
}
