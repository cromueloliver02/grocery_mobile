import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_pwd_form_event.dart';
part 'forgot_pwd_form_state.dart';

class ForgotPwdFormBloc extends Bloc<ForgotPwdFormEvent, ForgotPwdFormState> {
  ForgotPwdFormBloc() : super(ForgotPwdFormState.initial()) {
    on<ForgotPwdFormEmailSaved>(_onForgotPwdFormEmailSaved);
    on<ForgotPwdFormAutovalidateEnabled>(_onForgotPwdFormAutovalidateEnabled);
  }

  void _onForgotPwdFormEmailSaved(
    ForgotPwdFormEmailSaved event,
    Emitter<ForgotPwdFormState> emit,
  ) {
    emit(state.copyWith(email: () => event.email ?? state.email));
  }

  void _onForgotPwdFormAutovalidateEnabled(
    ForgotPwdFormAutovalidateEnabled event,
    Emitter<ForgotPwdFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
