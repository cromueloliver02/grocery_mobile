import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../cubits.dart';

part 'sign_up_form_state.dart';

class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit() : super(SignUpFormState.initial());

  void signUp(BuildContext ctx, {required GlobalKey<FormState> formKey}) {
    final SignUpFormCubit signUpFormCubit = ctx.read<SignUpFormCubit>();

    signUpFormCubit.enableAutovalidate();

    final FormState? form = formKey.currentState;

    if (form == null || !form.validate()) return;

    final SignUpFormState signupFormState = signUpFormCubit.state;

    ctx.read<SignUpCubit>().signupWithEmail(
          name: signupFormState.name,
          email: signupFormState.email,
          password: signupFormState.password,
          shipAddress: signupFormState.shipAddress,
        );
  }

  void changeName(String? name) {
    emit(state.copyWith(name: () => name ?? state.name));
  }

  void changeEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void changePassword(String? password) {
    emit(state.copyWith(password: () => password ?? state.password));
  }

  void changeShipAddress(String? shipAddress) {
    emit(state.copyWith(shipAddress: () => shipAddress ?? state.shipAddress));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(hidePassword: () => !state.hidePassword));
  }

  void enableAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
