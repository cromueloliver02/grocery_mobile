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
      cart: Cart.initial(),
      status: CartStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cart, status, error];

  @override
  String toString() => 'CartState(cart: $cart, status: $status, error: $error)';

  CartState copyWith({
    Cart Function()? cart,
    CartStatus Function()? status,
    GCRError Function()? error,
  }) {
    return CartState(
      cart: cart != null ? cart() : this.cart,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
