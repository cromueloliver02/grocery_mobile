part of 'sign_in_form_bloc.dart';

abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object?> get props => [];
}

class SignInFormEmailSaved extends SignInFormEvent {
  final String? email;

  const SignInFormEmailSaved({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class SignInFormPassSaved extends SignInFormEvent {
  final String? password;

  const SignInFormPassSaved({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class SignInFormPassToggled extends SignInFormEvent {}

class SignInFormAutovalidateEnabled extends SignInFormEvent {}
