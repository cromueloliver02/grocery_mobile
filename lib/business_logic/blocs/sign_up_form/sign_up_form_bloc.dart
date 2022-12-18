import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.initial()) {
    on<SignUpFormNameChanged>(_onChangeName);
    on<SignUpFormEmailChanged>(_onChangeEmail);
    on<SignUpFormPassChanged>(_onChangePassword);
    on<SignUpFormShipAddressChanged>(_onChangeShipAddress);
    on<SignUpFormPassToggled>(_onTogglePassword);
    on<SignUpFormAutovalidateEnabled>(_onEnableAutovalidate);
  }

  void _onChangeName(
    SignUpFormNameChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(name: event.name ?? state.name));
  }

  void _onChangeEmail(
    SignUpFormEmailChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onChangePassword(
    SignUpFormPassChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(password: event.password ?? state.password));
  }

  void _onChangeShipAddress(
    SignUpFormShipAddressChanged event,
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
