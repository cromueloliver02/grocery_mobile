import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEmailChanged>(_onChangeEmail);
    on<SignInFormPassChanged>(_onChangePassword);
    on<SignInFormPassToggled>(_onTogglePassword);
    on<SignInFormAutovalidateEnabled>(_onEnableAutovalidate);
  }

  void _onChangeEmail(
    SignInFormEmailChanged event,
    Emitter<SignInFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onChangePassword(
    SignInFormPassChanged event,
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
