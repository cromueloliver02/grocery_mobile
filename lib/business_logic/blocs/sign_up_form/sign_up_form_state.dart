part of 'sign_up_form_bloc.dart';

class SignUpFormState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String shipAddress;
  final bool hidePassword;
  final AutovalidateMode autovalidateMode;

  const SignUpFormState({
    required this.name,
    required this.email,
    required this.password,
    required this.shipAddress,
    required this.hidePassword,
    required this.autovalidateMode,
  });

  factory SignUpFormState.initial() {
    return const SignUpFormState(
      name: '',
      email: '',
      password: '',
      shipAddress: '',
      hidePassword: true,
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      email,
      password,
      shipAddress,
      hidePassword,
      autovalidateMode,
    ];
  }

  @override
  String toString() {
    return 'SignUpFormState(name: $name, email: $email, password: $password, shipAddress: $shipAddress, hidePassword: $hidePassword, autovalidateMode: $autovalidateMode)';
  }

  SignUpFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? shipAddress,
    bool? hidePassword,
    AutovalidateMode? autovalidateMode,
  }) {
    return SignUpFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      shipAddress: shipAddress ?? this.shipAddress,
      hidePassword: hidePassword ?? this.hidePassword,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
