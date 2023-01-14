import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import '../../../utils/utils.dart';
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

  @override
  Future<void> removeFromCart({
    required String userId,
    required String cartItemId,
  }) async {
    try {
      return await cartService.removeFromCart(
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
      return await cartService.changeCartItemQty(
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
      return await cartService.updateCartItemQty(
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
      return await cartService.clearCart(userId);
    } catch (err) {
      rethrow;
    }
  }
}
