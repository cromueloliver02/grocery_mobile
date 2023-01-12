part of 'increment_cart_item_cubit.dart';

class IncrementCartItemState extends Equatable {
  final String cartItemId;
  final IncrementCartItemStatus status;
  final GCRError error;

  const IncrementCartItemState({
    required this.cartItemId,
    required this.status,
    required this.error,
  });

  factory IncrementCartItemState.initial() {
    return const IncrementCartItemState(
      cartItemId: '',
      status: IncrementCartItemStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [cartItemId, status, error];

  @override
  String toString() =>
      'IncrementCartItemState(cartItemId: $cartItemId, status: $status, error: $error)';

  IncrementCartItemState copyWith({
    String Function()? cartItemId,
    IncrementCartItemStatus Function()? status,
    GCRError Function()? error,
  }) {
    return IncrementCartItemState(
      cartItemId: cartItemId != null ? cartItemId() : this.cartItemId,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
