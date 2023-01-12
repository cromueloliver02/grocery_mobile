part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final fb_auth.User? user;
  final AuthStatus status;

  const AuthState({
    required this.user,
    required this.status,
  });

  factory AuthState.initial() {
    return const AuthState(
      user: null,
      status: AuthStatus.unknown,
    );
  }

  @override
  List<Object?> get props => [user, status];

  @override
  String toString() => 'AuthState(user: $user, status: $status)';

  AuthState copyWith({
    fb_auth.User? Function()? user,
    AuthStatus Function()? status,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
      status: status != null ? status() : this.status,
    );
  }
}
