import 'package:cloud_firestore/cloud_firestore.dart' as fstore;

import '../../services/services.dart';
import '../../models/models.dart';
import '../../../utils/utils.dart';
import './base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final UserService userService;
  final ProductService productService;
  final OrderService orderService;

  OrderRepository({
    required this.userService,
    required this.productService,
    required this.orderService,
  });

  @override
  Future<Order> getOrder(String userId) async {
    try {
      final fstore.QuerySnapshot orderItemQuery =
          await orderService.fetchOrderItems(userId);
      final List<fstore.DocumentSnapshot> orderItemDocs = orderItemQuery.docs;

      final List<OrderItem> orderItems = [];

      for (final orderItemDoc in orderItemDocs) {
        final List<CartItem> cartItems = [];

        final cartItemMaps =
            List<Map<String, dynamic>>.from(orderItemDoc.get('cartItems'));

        for (final cartItemMap in cartItemMaps) {
          final String productId = cartItemMap['product'];

          final fstore.DocumentSnapshot productDoc =
              await productService.getProduct(productId);

          if (productDoc.exists) {
            final Product product = Product.fromDoc(productDoc);

            final CartItem cartItem = CartItem.fromMap(
              cartItemMap,
              product: product,
            );

            cartItems.insert(0, cartItem);
          }
        }

        final String userId = orderItemDoc.get(kUser);
        final fstore.DocumentSnapshot userDoc =
            await userService.getUser(userId);

        if (userDoc.exists) {
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
      }

      orderItems.sort((OrderItem a, OrderItem b) {
        return b.createdAt.compareTo(a.createdAt);
      });

      final Order order = Order(orderItems: orderItems);

      return order;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<OrderItem> placeOrder(OrderItem orderItem) async {
    try {
      final fstore.DocumentSnapshot orderItemDoc =
          await orderService.placeOrder(orderItem);

      final List<CartItem> cartItems = [];

      final cartItemMaps =
          List<Map<String, dynamic>>.from(orderItemDoc.get('cartItems'));

      for (final cartItemMap in cartItemMaps) {
        final String productId = cartItemMap['product'];

        final fstore.DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        if (productDoc.exists) {
          final Product product = Product.fromDoc(productDoc);

          final CartItem cartItem = CartItem.fromMap(
            cartItemMap,
            product: product,
          );

          cartItems.insert(0, cartItem);
        }
      }

      final String userId = orderItemDoc.get('user');
      final fstore.DocumentSnapshot userDoc = await userService.getUser(userId);

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
