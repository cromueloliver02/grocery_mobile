part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;
  final CartStatus status;
  final GCRError error;

  const CartState({
    required this.cart,
    required this.status,
    required this.error,
  });

  factory CartState.initial() {
    return CartState(
      cart: Cart(cartItems: <CartItem>[]),
      status: CartStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cart, status, error];

  @override
  String toString() => 'CartState(cart: $cart, status: $status, error: $error)';

  CartState copyWith({
    Cart? cart,
    CartStatus? status,
    GCRError? error,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
