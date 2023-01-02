part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;
  final UserStatus status;
  final GCRError error;

  const UserState({
    required this.user,
    required this.status,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      user: User.initial(),
      status: UserStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [user, status, error];

  @override
  String toString() => 'UserState(user: $user, status: $status, error: $error)';

  UserState copyWith({
    User? user,
    UserStatus? status,
    GCRError? error,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
