import '../../models/models.dart';

abstract class BaseOrderRepository {
  Future<OrderItem> placeOrder(OrderItem orderItem);
}
