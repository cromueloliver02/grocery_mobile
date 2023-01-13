import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_form_state.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit() : super(SignInFormState.initial());

  void changeSignInFormEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void changeSignInFormPass(String? password) {
    emit(state.copyWith(password: () => password ?? state.password));
  }

  void toggleSignInFormPass() {
    emit(state.copyWith(hidePassword: () => !state.hidePassword));
  }

  void enabledSignInFormAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
