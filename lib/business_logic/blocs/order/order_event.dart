part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderStarted extends OrderEvent {
  final String userId;

  const OrderStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class OrderPlaceRequested extends OrderEvent {
  final OrderItem orderItem;

  const OrderPlaceRequested({
    required this.orderItem,
  });

  @override
  List<Object> get props => [orderItem];
}

class OrderResetRequested extends OrderEvent {}
