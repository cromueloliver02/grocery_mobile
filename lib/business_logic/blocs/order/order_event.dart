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

class OrderResetRequested extends OrderEvent {}
