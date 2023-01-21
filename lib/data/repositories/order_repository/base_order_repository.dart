import '../../models/models.dart';

abstract class BaseOrderRepository {
  Future<Order> getOrder(String userId);

  Future<OrderItem> placeOrder(OrderItem orderItem);
}
