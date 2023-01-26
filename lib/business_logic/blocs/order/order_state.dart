part of 'order_bloc.dart';

class OrderState extends Equatable {
  final model.Order order;
  final OrderStatus status;
  final model.GCRError error;

  const OrderState({
    required this.order,
    required this.status,
    required this.error,
  });

  factory OrderState.initial() {
    return OrderState(
      order: model.Order.initial(),
      status: OrderStatus.initial,
      error: const model.GCRError(),
    );
  }

  @override
  List<Object> get props => [order, status, error];

  @override
  String toString() =>
      'OrderState(order: $order, status: $status, error: $error)';

  OrderState copyWith({
    model.Order Function()? order,
    OrderStatus Function()? status,
    model.GCRError Function()? error,
  }) {
    return OrderState(
      order: order != null ? order() : this.order,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
