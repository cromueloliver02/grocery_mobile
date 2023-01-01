part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final fb_auth.User? user;

  const AuthUserChanged({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class AuthSignoutRequested extends AuthEvent {}
