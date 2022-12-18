import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.initial()) {
    on<SignUpFormNameSaved>(_onChangeName);
    on<SignUpFormEmailSaved>(_onChangeEmail);
    on<SignUpFormPassSaved>(_onChangePassword);
    on<SignUpFormShipAddressSaved>(_onChangeShipAddress);
    on<SignUpFormPassToggled>(_onTogglePassword);
    on<SignUpFormAutovalidateEnabled>(_onEnableAutovalidate);
  }

  void _onChangeName(
    SignUpFormNameSaved event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(name: event.name ?? state.name));
  }

  void _onChangeEmail(
    SignUpFormEmailSaved event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onChangePassword(
    SignUpFormPassSaved event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(password: event.password ?? state.password));
  }

  void _onChangeShipAddress(
    SignUpFormShipAddressSaved event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(shipAddress: event.shipAddress ?? state.shipAddress));
  }

  void _onTogglePassword(
    SignUpFormPassToggled event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void _onEnableAutovalidate(
    SignUpFormAutovalidateEnabled event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
