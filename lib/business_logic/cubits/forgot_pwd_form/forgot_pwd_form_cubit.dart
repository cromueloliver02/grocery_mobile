import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_pwd_form_state.dart';

class ForgotPwdFormCubit extends Cubit<ForgotPwdFormState> {
  ForgotPwdFormCubit() : super(ForgotPwdFormState.initial());

  void changeforgotPwdFormEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void enabledForgotPwdFormAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
