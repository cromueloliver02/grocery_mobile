part of 'forgot_pwd_form_bloc.dart';

class ForgotPwdFormState extends Equatable {
  final String email;
  final AutovalidateMode autovalidateMode;

  const ForgotPwdFormState({
    required this.email,
    required this.autovalidateMode,
  });

  factory ForgotPwdFormState.initial() {
    return const ForgotPwdFormState(
      email: '',
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  @override
  List<Object> get props => [email, autovalidateMode];

  @override
  String toString() =>
      'ForgotPwdFormState(email: $email, autovalidateMode: $autovalidateMode)';

  ForgotPwdFormState copyWith({
    String? email,
    AutovalidateMode? autovalidateMode,
  }) {
    return ForgotPwdFormState(
      email: email ?? this.email,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
