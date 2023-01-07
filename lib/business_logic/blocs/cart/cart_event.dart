part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  final String userId;

  const CartStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class CartItemAdded extends CartEvent {
  final CartItem cartItem;

  const CartItemAdded({
    required this.cartItem,
  });

  @override
  List<Object> get props => [cartItem];
}

class CartItemIncremented extends CartEvent {
  final String id;

  const CartItemIncremented({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CartItemDecremented extends CartEvent {
  final String id;

  const CartItemDecremented({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CartItemRemoved extends CartEvent {
  final String id;

  const CartItemRemoved({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CartCleared extends CartEvent {}
