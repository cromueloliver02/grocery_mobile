part of 'cart_action_cubit.dart';

class CartActionState extends Equatable {
  final CartActionType actionType;
  final CartActionStatus status;
  final GCRError error;

  const CartActionState({
    required this.actionType,
    required this.status,
    required this.error,
  });

  factory CartActionState.initial() {
    return const CartActionState(
      actionType: CartActionType.initial,
      status: CartActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [actionType, status, error];

  @override
  String toString() =>
      'CartActionState(actionType: $actionType, status: $status, error: $error)';

  CartActionState copyWith({
    CartActionType Function()? actionType,
    CartActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return CartActionState(
      actionType: actionType != null ? actionType() : this.actionType,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
