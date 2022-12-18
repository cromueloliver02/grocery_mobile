import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEmailSaved>(_onSaveEmail);
    on<SignInFormPassSaved>(_onSavePassword);
    on<SignInFormPassToggled>(_onTogglePassword);
    on<SignInFormAutovalidateEnabled>(_onEnableAutovalidate);
  }

  void _onSaveEmail(
    SignInFormEmailSaved event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onSavePassword(
    SignInFormPassSaved event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(password: event.password ?? state.password));
  }

  void _onTogglePassword(
    SignInFormPassToggled event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void _onEnableAutovalidate(
    SignInFormAutovalidateEnabled event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
