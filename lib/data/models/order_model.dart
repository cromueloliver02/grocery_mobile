import 'package:equatable/equatable.dart';

import './models.dart';

class Order extends Equatable {
  final List<OrderItem> orderItems;

  const Order({
    required this.orderItems,
  });

  factory Order.initial() {
    return const Order(orderItems: <OrderItem>[]);
  }

  @override
  List<Object?> get props => [orderItems];

  @override
  String toString() => 'Order(orderItems: $orderItems)';

  Order copyWith({
    List<OrderItem> Function()? orderItems,
  }) {
    return Order(
      orderItems: orderItems != null ? orderItems() : this.orderItems,
    );
  }
}
