import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEmailSaved>(_onSignInFormEmailSaved);
    on<SignInFormPassSaved>(_onSignInFormPassSaved);
    on<SignInFormPassToggled>(_onSignInFormPassToggled);
    on<SignInFormAutovalidateEnabled>(_onSignInFormAutovalidateEnabled);
  }

  void _onSignInFormEmailSaved(
    SignInFormEmailSaved event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onSignInFormPassSaved(
    SignInFormPassSaved event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(password: event.password ?? state.password));
  }

  void _onSignInFormPassToggled(
    SignInFormPassToggled event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void _onSignInFormAutovalidateEnabled(
    SignInFormAutovalidateEnabled event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
