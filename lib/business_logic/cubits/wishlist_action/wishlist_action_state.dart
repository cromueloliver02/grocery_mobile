part of 'wishlist_action_cubit.dart';

class WishlistActionState extends Equatable {
  final WishlistActionType actionType;
  final WishlistActionStatus status;
  final GCRError error;

  const WishlistActionState({
    required this.actionType,
    required this.status,
    required this.error,
  });

  factory WishlistActionState.initial() {
    return const WishlistActionState(
      actionType: WishlistActionType.initial,
      status: WishlistActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [actionType, status, error];

  @override
  String toString() =>
      'WishlistActionState(actionType: $actionType, status: $status, error: $error)';

  WishlistActionState copyWith({
    WishlistActionType Function()? actionType,
    WishlistActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return WishlistActionState(
      actionType: actionType != null ? actionType() : this.actionType,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
