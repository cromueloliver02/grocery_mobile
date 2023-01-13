import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

import '../cubits.dart';

part 'sign_in_form_state.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit() : super(SignInFormState.initial());

  void signIn(BuildContext ctx, {required GlobalKey<FormState> formKey}) {
    final SignInFormCubit signInFormCubit = ctx.read<SignInFormCubit>();

    signInFormCubit.enableAutovalidate();

    final FormState? form = formKey.currentState;

    if (form == null || !form.validate()) return;

    final SignInFormState signInFormState = signInFormCubit.state;

    ctx.read<SignInCubit>().signinWithEmail(
          email: signInFormState.email,
          password: signInFormState.password,
        );
  }

  void changeEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void changePassword(String? password) {
    emit(state.copyWith(password: () => password ?? state.password));
  }

  void togglePassword() {
    emit(state.copyWith(hidePassword: () => !state.hidePassword));
  }

  void enableAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
