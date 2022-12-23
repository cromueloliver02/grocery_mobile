part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class CartItemAdded extends CartEvent {
  final Product product;

  const CartItemAdded({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
