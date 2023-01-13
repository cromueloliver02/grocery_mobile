part of 'sign_in_form_cubit.dart';

class SignInFormState extends Equatable {
  final String email;
  final String password;
  final bool hidePassword;
  final AutovalidateMode autovalidateMode;

  const SignInFormState({
    required this.email,
    required this.password,
    required this.hidePassword,
    required this.autovalidateMode,
  });

  factory SignInFormState.initial() {
    return const SignInFormState(
      email: '',
      password: '',
      hidePassword: true,
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  @override
  List<Object> get props => [email, password, hidePassword, autovalidateMode];

  @override
  String toString() {
    return 'SignInFormState(email: $email, password: $password, hidePassword: $hidePassword, autovalidateMode: $autovalidateMode)';
  }

  SignInFormState copyWith({
    String Function()? email,
    String Function()? password,
    bool Function()? hidePassword,
    AutovalidateMode Function()? autovalidateMode,
  }) {
    return SignInFormState(
      email: email != null ? email() : this.email,
      password: password != null ? password() : this.password,
      hidePassword: hidePassword != null ? hidePassword() : this.hidePassword,
      autovalidateMode:
          autovalidateMode != null ? autovalidateMode() : this.autovalidateMode,
    );
  }
}
