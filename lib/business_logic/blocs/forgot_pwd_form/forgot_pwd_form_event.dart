part of 'forgot_pwd_form_bloc.dart';

abstract class ForgotPwdFormEvent extends Equatable {
  const ForgotPwdFormEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPwdFormEmailSaved extends ForgotPwdFormEvent {
  final String? email;

  const ForgotPwdFormEmailSaved({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class ForgotPwdFormAutovalidateEnabled extends ForgotPwdFormEvent {}
