part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoaded extends CartEvent {
  final String userId;

  const CartLoaded({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class CartResetRequested extends CartEvent {}
