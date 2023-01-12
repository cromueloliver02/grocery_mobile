part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;
  final GCRError error;

  const CartState({
    required this.cart,
    required this.error,
  });

  factory CartState.initial() {
    return CartState(
      cart: Cart.initial(),
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cart, error];

  @override
  String toString() {
    return 'CartState(cart: $cart, error: $error)';
  }

  CartState copyWith({
    Cart Function()? cart,
    GCRError Function()? error,
  }) {
    return CartState(
      cart: cart != null ? cart() : this.cart,
      error: error != null ? error() : this.error,
    );
  }
}
