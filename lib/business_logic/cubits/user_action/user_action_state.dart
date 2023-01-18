part of 'user_action_cubit.dart';

class UserActionState extends Equatable {
  final UserActionStatus status;
  final GCRError error;

  const UserActionState({
    required this.status,
    required this.error,
  });

  factory UserActionState.initial() {
    return const UserActionState(
      status: UserActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'UserActionState(status: $status, error: $error)';

  UserActionState copyWith({
    UserActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return UserActionState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
