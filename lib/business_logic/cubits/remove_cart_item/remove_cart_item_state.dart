part of 'remove_cart_item_cubit.dart';

class RemoveCartItemState extends Equatable {
  final String cartItemId;
  final RemoveCartItemStatus status;
  final GCRError error;

  const RemoveCartItemState({
    required this.cartItemId,
    required this.status,
    required this.error,
  });

  factory RemoveCartItemState.initial() {
    return const RemoveCartItemState(
      cartItemId: '',
      status: RemoveCartItemStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [cartItemId, status, error];

  @override
  String toString() =>
      'RemoveCartItemState(cartItemId: $cartItemId, status: $status, error: $error)';

  RemoveCartItemState copyWith({
    String Function()? cartItemId,
    RemoveCartItemStatus Function()? status,
    GCRError Function()? error,
  }) {
    return RemoveCartItemState(
      cartItemId: cartItemId != null ? cartItemId() : this.cartItemId,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
