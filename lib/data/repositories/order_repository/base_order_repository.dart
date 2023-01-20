import '../../models/models.dart';

abstract class BaseOrderRepository {
  Future<List<OrderItem>> fetchOrders(String userId);

  Future<OrderItem> placeOrder(OrderItem orderItem);
}
