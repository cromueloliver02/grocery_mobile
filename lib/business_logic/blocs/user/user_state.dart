part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;
  final GCRError error;

  const UserState({
    required this.user,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      user: User.initial(),
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [user, error];

  @override
  String toString() {
    return 'UserState(user: $user, error: $error)';
  }

  UserState copyWith({
    User Function()? user,
    GCRError Function()? error,
  }) {
    return UserState(
      user: user != null ? user() : this.user,
      error: error != null ? error() : this.error,
    );
  }
}
