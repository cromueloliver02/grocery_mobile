part of 'update_cart_item_qty_cubit.dart';

class UpdateCartItemQtyState extends Equatable {
  final String cartItemId;
  final int newQuantity;
  final UpdateCartItemQtyStatus status;
  final GCRError error;

  const UpdateCartItemQtyState({
    required this.cartItemId,
    required this.newQuantity,
    required this.status,
    required this.error,
  });

  factory UpdateCartItemQtyState.initial() {
    return const UpdateCartItemQtyState(
      cartItemId: '',
      newQuantity: 0,
      status: UpdateCartItemQtyStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [cartItemId, newQuantity, status, error];

  @override
  String toString() {
    return 'UpdateCartItemQtyState(cartItemId: $cartItemId, newQuantity: $newQuantity, status: $status, error: $error)';
  }

  UpdateCartItemQtyState copyWith({
    String Function()? cartItemId,
    int Function()? newQuantity,
    UpdateCartItemQtyStatus Function()? status,
    GCRError Function()? error,
  }) {
    return UpdateCartItemQtyState(
      cartItemId: cartItemId != null ? cartItemId() : this.cartItemId,
      newQuantity: newQuantity != null ? newQuantity() : this.newQuantity,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
