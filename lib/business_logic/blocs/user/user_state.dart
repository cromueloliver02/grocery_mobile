part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;
  final UserStatus status;
  final UserFormStatus formStatus;
  final GCRError error;

  const UserState({
    required this.user,
    required this.status,
    required this.formStatus,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      user: User.initial(),
      status: UserStatus.initial,
      formStatus: UserFormStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [user, status, formStatus, error];

  @override
  String toString() {
    return 'UserState(user: $user, status: $status, formStatus: $formStatus, error: $error)';
  }

  UserState copyWith({
    User? user,
    UserStatus? status,
    UserFormStatus? formStatus,
    GCRError? error,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
