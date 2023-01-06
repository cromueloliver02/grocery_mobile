part of 'cart_item_cubit.dart';

class CartItemState extends Equatable {
  final CartItemFormStatus formStatus;
  final GCRError error;

  const CartItemState({
    required this.formStatus,
    required this.error,
  });

  factory CartItemState.initial() {
    return const CartItemState(
      formStatus: CartItemFormStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [formStatus, error];

  @override
  String toString() => 'CartItemState(formStatus: $formStatus, error: $error)';

  CartItemState copyWith({
    CartItemFormStatus? formStatus,
    GCRError? error,
  }) {
    return CartItemState(
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
