import '../../services/cart_service.dart';
import '../../models/cart_item_model.dart';
import './base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final CartService cartService;

  CartRepository({
    required this.cartService,
  });

  @override
  Future<void> addToCart(CartItem cartItem) async {
    try {
      return cartService.addToCart(cartItem);
    } catch (err) {
      rethrow;
    }
  }
}
