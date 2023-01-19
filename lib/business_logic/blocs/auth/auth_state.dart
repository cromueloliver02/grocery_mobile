part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final fb_auth.User? user;
  final AuthStatus status;
  final GCRError error;

  const AuthState({
    required this.user,
    required this.status,
    required this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      user: null,
      status: AuthStatus.unknown,
      error: GCRError(),
    );
  }

  @override
  List<Object?> get props => [user, status, error];

  @override
  String toString() => 'AuthState(user: $user, status: $status, error: $error)';

  AuthState copyWith({
    fb_auth.User? Function()? user,
    AuthStatus Function()? status,
    GCRError Function()? error,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
