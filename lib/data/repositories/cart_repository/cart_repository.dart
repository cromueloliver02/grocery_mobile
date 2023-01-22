import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import '../../../utils/utils.dart';
import './base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final ProductService productService;
  final CartService cartService;

  CartRepository({
    required this.productService,
    required this.cartService,
  });

  @override
  Future<Cart> getCart(String userId) async {
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

        if (productDoc.exists) {
          final CartItem cartItem = CartItem.fromMap(
            cartItemMap,
            product: Product.fromDoc(productDoc),
          );

          cartItems.insert(0, cartItem);
        }
      }

      cartItems.sort((CartItem a, CartItem b) {
        return b.createdAt.compareTo(a.createdAt);
      });

      final Cart cart = Cart.fromDoc(cartDoc, cartItems: cartItems);

      return cart;
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
      final CartItem newCartItem =
          await cartService.addToCart(userId: userId, cartItem: cartItem);

      return newCartItem;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromCart({
    required String userId,
    required String cartItemId,
  }) async {
    try {
      await cartService.removeFromCart(
        userId: userId,
        cartItemId: cartItemId,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> changeCartItemQty({
    required String userId,
    required String cartItemId,
    required CartItemQtyAction action,
  }) async {
    try {
      await cartService.changeCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        action: action,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> updateCartItemQty({
    required String userId,
    required String cartItemId,
    required int newQuantity,
  }) async {
    try {
      await cartService.updateCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        newQuantity: newQuantity,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      await cartService.clearCart(userId);
    } catch (err) {
      rethrow;
    }
  }
}
