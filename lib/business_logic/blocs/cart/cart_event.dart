part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

// class CartItemAdded extends CartEvent {
//   final String userId;
//   final Product product;

//   const CartItemAdded({
//     required this.userId,
//     required this.product,
//   });

//   @override
//   List<Object> get props => [userId, product];
// }

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
