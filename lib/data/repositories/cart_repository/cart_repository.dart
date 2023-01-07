import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/cart_service.dart';
import '../../models/models.dart';
import '../../../utils/utils.dart';
import './base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  final CartService cartService;

  CartRepository({
    required this.cartService,
  });

  @override
  Future<List<CartItem>> fetchCartItems(String userId) async {
    try {
      final CollectionReference productsRef =
          FirebaseFirestore.instance.collection(kProductsCollectionPath);
      final List<CartItem> cartItems = [];

      final QuerySnapshot cartItemsSnapshot =
          await cartService.fetchCartItems(userId);

      for (DocumentSnapshot cartItemDoc in cartItemsSnapshot.docs) {
        String productId =
            (cartItemDoc.data() as Map<String, dynamic>)['product'];

        DocumentReference productRef = productsRef.doc(productId);

        DocumentSnapshot productDoc = await productRef.get();

        final CartItem cartItem = CartItem.fromDoc(
          cartItemDoc,
          product: Product.fromDoc(productDoc),
        );

        cartItems.add(cartItem);
      }

      return cartItems;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> addToCart(CartItem cartItem) async {
    try {
      return cartService.addToCart(cartItem);
    } catch (err) {
      rethrow;
    }
  }
}
