part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;
  final CartFormStatus formStatus;
  final GCRError error;

  const CartState({
    required this.cart,
    required this.formStatus,
    required this.error,
  });

  factory CartState.initial() {
    return CartState(
      cart: Cart(userId: '', cartItems: <CartItem>[]),
      formStatus: CartFormStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cart, formStatus, error];

  @override
  String toString() {
    return 'CartState(cart: $cart, formStatus: $formStatus, error: $error)';
  }

  CartState copyWith({
    Cart Function()? cart,
    CartFormStatus Function()? formStatus,
    GCRError Function()? error,
  }) {
    return CartState(
      cart: cart != null ? cart() : this.cart,
      formStatus: formStatus != null ? formStatus() : this.formStatus,
      error: error != null ? error() : this.error,
    );
  }
}
