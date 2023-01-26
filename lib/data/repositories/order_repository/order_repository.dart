import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart' as model;
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
  Stream<model.Order> getOrder(String userId) async* {
    try {
      final Stream<QuerySnapshot> orderItemsQueryStream =
          orderService.fetchOrderItems(userId);

      await for (final QuerySnapshot orderItemQuery in orderItemsQueryStream) {
        final List<model.OrderItem> orderItems = [];

        for (final QueryDocumentSnapshot orderItemDoc in orderItemQuery.docs) {
          final cartItemMaps =
              List<Map<String, dynamic>>.from(orderItemDoc.get(kCartItems));

          final List<model.CartItem> cartItems = [];

          for (final Map<String, dynamic> cartItemMap in cartItemMaps) {
            final String productId = cartItemMap[kProduct];

            final DocumentSnapshot productDoc = await FirebaseFirestore.instance
                .collection(kProductsCollectionPath)
                .doc(productId)
                .get();

            final model.Product product = model.Product.fromDoc(productDoc);

            final model.CartItem cartItem = model.CartItem.fromMap(
              cartItemMap,
              product: product,
            );

            cartItems.insert(0, cartItem);
          }

          final String userId = orderItemDoc.get(kUser);

          final DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection(kUsersCollectionPath)
              .doc(userId)
              .get();

          final model.User user = model.User.fromDoc(
            userDoc,
            wishlist: const [], // wishlist is unnecessary to populate
          );

          final model.OrderItem orderItem = model.OrderItem.fromDoc(
            orderItemDoc,
            cartItems: cartItems,
            user: user,
          );

          orderItems.insert(0, orderItem);
        }

        orderItems.sort((model.OrderItem a, model.OrderItem b) =>
            b.createdAt.compareTo(a.createdAt));

        yield model.Order(orderItems: orderItems);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> placeOrder(model.OrderItem orderItem) async {
    try {
      await orderService.placeOrder(orderItem);
    } catch (err) {
      rethrow;
    }
  }
}
