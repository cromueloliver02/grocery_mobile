part of 'add_cart_item_cubit.dart';

class AddCartItemState extends Equatable {
  final CartItem cartItem;
  final AddCartItemStatus status;
  final GCRError error;

  const AddCartItemState({
    required this.cartItem,
    required this.status,
    required this.error,
  });

  factory AddCartItemState.initial() {
    return AddCartItemState(
      cartItem: CartItem.empty(),
      status: AddCartItemStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [cartItem, status, error];

  @override
  String toString() =>
      'AddCartItemState(cartItem: $cartItem, status: $status, error: $error)';

  AddCartItemState copyWith({
    CartItem? cartItem,
    AddCartItemStatus? status,
    GCRError? error,
  }) {
    return AddCartItemState(
      cartItem: cartItem ?? this.cartItem,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
