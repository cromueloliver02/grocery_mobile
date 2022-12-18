import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_pwd_form_event.dart';
part 'forgot_pwd_form_state.dart';

class ForgotPwdFormBloc extends Bloc<ForgotPwdFormEvent, ForgotPwdFormState> {
  ForgotPwdFormBloc() : super(ForgotPwdFormState.initial()) {
    on<ForgotPwdFormEmailSaved>(_onSaveEmail);
    on<ForgotPwdFormAutovalidateEnabled>(_onEnableAutovalidate);
  }

  void _onSaveEmail(
    ForgotPwdFormEmailSaved event,
    Emitter<ForgotPwdFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onEnableAutovalidate(
    ForgotPwdFormAutovalidateEnabled event,
    Emitter<ForgotPwdFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
