import '../../models/models.dart';

abstract class BaseOrderRepository {
  Stream<Order> getOrder(String userId);

  Future<void> placeOrder(OrderItem orderItem);
}
