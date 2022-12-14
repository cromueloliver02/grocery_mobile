part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;

  final UserFormStatus formStatus;
  final GCRError error;

  const UserState({
    required this.user,
    required this.formStatus,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      user: User.initial(),
      formStatus: UserFormStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [user, formStatus, error];

  @override
  String toString() {
    return 'UserState(user: $user, formStatus: $formStatus, error: $error)';
  }

  UserState copyWith({
    User? user,
    UserFormStatus? formStatus,
    GCRError? error,
  }) {
    return UserState(
      user: user ?? this.user,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
