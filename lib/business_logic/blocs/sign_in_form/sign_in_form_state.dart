part of 'sign_in_form_bloc.dart';

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
    String? email,
    String? password,
    bool? hidePassword,
    AutovalidateMode? autovalidateMode,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      hidePassword: hidePassword ?? this.hidePassword,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
