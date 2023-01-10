import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import './base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final CartService cartService;
  final ProductService productService;

  CartRepository({
    required this.cartService,
    required this.productService,
  });

  @override
  Future<List<CartItem>> fetchCartItems(String userId) async {
    try {
      List<CartItem> cartItems = [];

      // the id of cart is the same as the user id
      final DocumentSnapshot cartDoc = await cartService.getCart(userId);

      final List<Map<String, dynamic>> cartItemMaps =
          List<Map<String, dynamic>>.from(cartDoc.get('cartItems'));

      for (final cartItemMap in cartItemMaps) {
        final String productId = cartItemMap['product'];

        final DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        final CartItem cartItem = CartItem.fromMap(
          cartItemMap,
          product: Product.fromDoc(productDoc),
        );

        cartItems.insert(0, cartItem);
      }

      return cartItems;
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
