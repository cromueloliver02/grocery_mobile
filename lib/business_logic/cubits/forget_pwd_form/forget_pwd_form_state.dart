part of 'forget_pwd_form_cubit.dart';

class ForgetPwdFormState extends Equatable {
  final String email;
  final AutovalidateMode autovalidateMode;

  const ForgetPwdFormState({
    required this.email,
    required this.autovalidateMode,
  });

  factory ForgetPwdFormState.initial() {
    return const ForgetPwdFormState(
      email: '',
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  @override
  List<Object> get props => [email, autovalidateMode];

  @override
  String toString() =>
      'ForgetPwdFormState(email: $email, autovalidateMode: $autovalidateMode)';

  ForgetPwdFormState copyWith({
    String Function()? email,
    AutovalidateMode Function()? autovalidateMode,
  }) {
    return ForgetPwdFormState(
      email: email != null ? email() : this.email,
      autovalidateMode:
          autovalidateMode != null ? autovalidateMode() : this.autovalidateMode,
    );
  }
}
