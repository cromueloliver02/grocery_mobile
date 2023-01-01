part of 'sign_up_form_bloc.dart';

abstract class SignUpFormEvent extends Equatable {
  const SignUpFormEvent();

  @override
  List<Object?> get props => [];
}

class SignUpFormNameChanged extends SignUpFormEvent {
  final String? name;

  const SignUpFormNameChanged({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class SignUpFormEmailChanged extends SignUpFormEvent {
  final String? email;

  const SignUpFormEmailChanged({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class SignUpFormPassChanged extends SignUpFormEvent {
  final String? password;

  const SignUpFormPassChanged({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class SignUpFormShipAddressChanged extends SignUpFormEvent {
  final String? shipAddress;

  const SignUpFormShipAddressChanged({
    required this.shipAddress,
  });

  @override
  List<Object?> get props => [shipAddress];
}

class SignUpFormPassToggled extends SignUpFormEvent {}

class SignUpFormAutovalidateEnabled extends SignUpFormEvent {}
