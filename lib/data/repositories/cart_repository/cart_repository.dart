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
  Stream<Cart> getCart(String userId) async* {
    try {
      final Stream<DocumentSnapshot> cartDocStream =
          cartService.getCart(userId);

      await for (final DocumentSnapshot cartDoc in cartDocStream) {
        final cartItemMaps =
            List<Map<String, dynamic>>.from(cartDoc.get('cartItems'));

        final List<CartItem> cartItems = [];

        for (final cartItemMap in cartItemMaps) {
          final String productId = cartItemMap['product'];

          final DocumentSnapshot productDoc = await FirebaseFirestore.instance
              .collection(kProductsCollectionPath)
              .doc(productId)
              .get();

          final Product product = Product.fromDoc(productDoc);

          final CartItem cartItem = CartItem.fromMap(
            cartItemMap,
            product: product,
          );

          cartItems.insert(0, cartItem);
        }

        cartItems.sort(
          (CartItem a, CartItem b) => b.createdAt.compareTo(a.createdAt),
        );

        final Cart cart = Cart.fromDoc(
          cartDoc,
          cartItems: cartItems,
        );

        yield cart;
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> addToCart({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      await cartService.addToCart(
        userId: userId,
        newCartItems: newCartItems,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromCart({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      await cartService.removeFromCart(
        userId: userId,
        newCartItems: newCartItems,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> changeCartItemQty({
    required String cartItemId,
    required Cart cart,
    required CartItemQtyAction action,
  }) async {
    try {
      await cartService.changeCartItemQty(
        cartItemId: cartItemId,
        cart: cart,
        action: action,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> updateCartItemQty({
    required String cartItemId,
    required Cart cart,
    required int newQuantity,
  }) async {
    try {
      await cartService.updateCartItemQty(
        cartItemId: cartItemId,
        cart: cart,
        newQuantity: newQuantity,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> clearCart(Cart cart) async {
    try {
      await cartService.clearCart(cart);
    } catch (err) {
      rethrow;
    }
  }
}
