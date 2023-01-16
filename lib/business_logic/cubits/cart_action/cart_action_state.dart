part of 'cart_action_cubit.dart';

class CartActionState extends Equatable {
  final CartActionStatus status;
  final GCRError error;

  const CartActionState({
    required this.status,
    required this.error,
  });

  factory CartActionState.initial() {
    return const CartActionState(
      status: CartActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'CartActionState(status: $status, error: $error)';

  CartActionState copyWith({
    CartActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return CartActionState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
