import '../../services/cart_service.dart';
import '../../models/models.dart';
import './base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final CartService cartService;

  CartRepository({
    required this.cartService,
  });

  @override
  Future<List<CartItem>> fetchCartItems(String userId) async {
    try {
      return await cartService.fetchCartItems(userId);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<CartItem> addToCart({
    required String userId,
    required CartItem cartItem,
  }) async {
    try {
      return await cartService.addToCart(userId: userId, cartItem: cartItem);
    } catch (err) {
      rethrow;
    }
  }
}
