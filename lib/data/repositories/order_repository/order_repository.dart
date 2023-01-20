import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import './base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final OrderService orderService;
  final ProductService productService;

  OrderRepository({
    required this.orderService,
    required this.productService,
  });

  @override
  Future<OrderItem> placeOrder(OrderItem orderItem) async {
    try {
      final DocumentSnapshot orderItemDoc =
          await orderService.placeOrder(orderItem);

      final List<CartItem> cartItems = [];

      final cartItemMaps =
          List<Map<String, dynamic>>.from(orderItemDoc.get('cartItems'));

      for (final cartItemMap in cartItemMaps) {
        final String productId = cartItemMap['product'];

        final DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        if (!productDoc.exists) {
          throw GCRError.exception('Product does not exist');
        }

        final Product product = Product.fromDoc(productDoc);

        final CartItem cartItem = CartItem.fromMap(
          cartItemMap,
          product: product,
        );

        cartItems.insert(0, cartItem);
      }

      final OrderItem newOrderItem = OrderItem.fromDoc(
        orderItemDoc,
        cartItems: cartItems,
      );

      return newOrderItem;
    } catch (err) {
      rethrow;
    }
  }
}
