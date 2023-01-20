part of 'order_action_cubit.dart';

class OrderActionState extends Equatable {
  final OrderActionType actionType;
  final OrderActionStatus status;
  final GCRError error;

  const OrderActionState({
    required this.actionType,
    required this.status,
    required this.error,
  });

  factory OrderActionState.initial() {
    return const OrderActionState(
      actionType: OrderActionType.initial,
      status: OrderActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [actionType, status, error];

  @override
  String toString() =>
      'OrderActionState(actionType: $actionType, status: $status, error: $error)';

  OrderActionState copyWith({
    OrderActionType Function()? actionType,
    OrderActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return OrderActionState(
      actionType: actionType != null ? actionType() : this.actionType,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
