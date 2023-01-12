part of 'decrement_cart_item_cubit.dart';

class DecrementCartItemState extends Equatable {
  final String cartItemId;
  final DecrementCartItemStatus status;
  final GCRError error;

  const DecrementCartItemState({
    required this.cartItemId,
    required this.status,
    required this.error,
  });

  factory DecrementCartItemState.initial() {
    return const DecrementCartItemState(
      cartItemId: '',
      status: DecrementCartItemStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [cartItemId, status, error];

  @override
  String toString() =>
      'DecrementCartItemState(cartItemId: $cartItemId, status: $status, error: $error)';

  DecrementCartItemState copyWith({
    String Function()? cartItemId,
    DecrementCartItemStatus Function()? status,
    GCRError Function()? error,
  }) {
    return DecrementCartItemState(
      cartItemId: cartItemId != null ? cartItemId() : this.cartItemId,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
