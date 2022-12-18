part of 'sign_in_form_bloc.dart';

abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object?> get props => [];
}

class SignInFormEmailChanged extends SignInFormEvent {
  final String? email;

  const SignInFormEmailChanged({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class SignInFormPassChanged extends SignInFormEvent {
  final String? password;

  const SignInFormPassChanged({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class SignInFormPassToggled extends SignInFormEvent {}

class SignInFormAutovalidateEnabled extends SignInFormEvent {}
