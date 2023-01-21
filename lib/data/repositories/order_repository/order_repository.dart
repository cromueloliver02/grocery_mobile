import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import './base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final OrderService orderService;
  final ProductService productService;
  final UserService userService;

  OrderRepository({
    required this.orderService,
    required this.productService,
    required this.userService,
  });

  @override
  Future<List<OrderItem>> fetchOrders(String userId) async {
    try {
      final QuerySnapshot orderQuery = await orderService.fetchOrders(userId);
      final List<DocumentSnapshot> orderItemDocs = orderQuery.docs;

      final List<OrderItem> orderItems = [];

      for (final orderItemDoc in orderItemDocs) {
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

        final String userId = orderItemDoc.get('user');
        final DocumentSnapshot userDoc = await userService.getUser(userId);

        final User user = User.fromDoc(
          userDoc,
          wishlist: const <Product>[], // wishlist is unnecessary to populate
        );

        final OrderItem orderItem = OrderItem.fromDoc(
          orderItemDoc,
          cartItems: cartItems,
          user: user,
        );

        orderItems.insert(0, orderItem);
      }

      orderItems.sort((OrderItem a, OrderItem b) {
        return b.createdAt.compareTo(a.createdAt);
      });

      return orderItems;
    } catch (err) {
      rethrow;
    }
  }

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

      final String userId = orderItemDoc.get('user');
      final DocumentSnapshot userDoc = await userService.getUser(userId);

      final User user = User.fromDoc(
        userDoc,
        wishlist: const <Product>[], // wishlist is unnecessary to populate
      );

      final OrderItem newOrderItem = OrderItem.fromDoc(
        orderItemDoc,
        cartItems: cartItems,
        user: user,
      );

      return newOrderItem;
    } catch (err) {
      rethrow;
    }
  }
}
