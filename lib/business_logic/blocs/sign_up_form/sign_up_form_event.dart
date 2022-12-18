part of 'sign_up_form_bloc.dart';

abstract class SignUpFormEvent extends Equatable {
  const SignUpFormEvent();

  @override
  List<Object?> get props => [];
}

class SignUpFormNameSaved extends SignUpFormEvent {
  final String? name;

  const SignUpFormNameSaved({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class SignUpFormEmailSaved extends SignUpFormEvent {
  final String? email;

  const SignUpFormEmailSaved({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class SignUpFormPassSaved extends SignUpFormEvent {
  final String? password;

  const SignUpFormPassSaved({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class SignUpFormShipAddressSaved extends SignUpFormEvent {
  final String? shipAddress;

  const SignUpFormShipAddressSaved({
    required this.shipAddress,
  });

  @override
  List<Object?> get props => [shipAddress];
}

class SignUpFormPassToggled extends SignUpFormEvent {}

class SignUpFormAutovalidateEnabled extends SignUpFormEvent {}
