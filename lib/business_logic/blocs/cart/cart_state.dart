part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;
  final CartStatus status;
  final CartFormStatus formStatus;
  final GCRError error;

  const CartState({
    required this.cart,
    required this.status,
    required this.formStatus,
    required this.error,
  });

  factory CartState.initial() {
    return CartState(
      cart: Cart(cartItems: <CartItem>[]),
      status: CartStatus.initial,
      formStatus: CartFormStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cart, status, formStatus, error];

  @override
  String toString() {
    return 'CartState(cart: $cart, status: $status, formStatus: $formStatus, error: $error)';
  }

  CartState copyWith({
    Cart? cart,
    CartStatus? status,
    CartFormStatus? formStatus,
    GCRError? error,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
