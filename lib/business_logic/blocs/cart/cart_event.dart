part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoaded extends CartEvent {
  final Cart cart;

  const CartLoaded({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
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
  final String cartItemId;

  const CartItemIncremented({
    required this.cartItemId,
  });

  @override
  List<Object> get props => [cartItemId];
}

class CartItemDecremented extends CartEvent {
  final String cartItemId;

  const CartItemDecremented({
    required this.cartItemId,
  });

  @override
  List<Object> get props => [cartItemId];
}

class CartItemRemoved extends CartEvent {
  final String cartItemId;

  const CartItemRemoved({
    required this.cartItemId,
  });

  @override
  List<Object> get props => [cartItemId];
}

class CartCleared extends CartEvent {}

class CartResetRequested extends CartEvent {}
