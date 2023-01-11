import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.initial()) {
    on<SignUpFormNameChanged>(_onSignUpFormNameChanged);
    on<SignUpFormEmailChanged>(_onSignUpFormEmailChanged);
    on<SignUpFormPassChanged>(_onSignUpFormPassChanged);
    on<SignUpFormShipAddressChanged>(_onSignUpFormShipAddressChanged);
    on<SignUpFormPassToggled>(_onSignUpFormPassToggled);
    on<SignUpFormAutovalidateEnabled>(_onSignUpFormAutovalidateEnabled);
  }

  void _onSignUpFormNameChanged(
    SignUpFormNameChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(name: event.name ?? state.name));
  }

  void _onSignUpFormEmailChanged(
    SignUpFormEmailChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(email: event.email ?? state.email));
  }

  void _onSignUpFormPassChanged(
    SignUpFormPassChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(password: event.password ?? state.password));
  }

  void _onSignUpFormShipAddressChanged(
    SignUpFormShipAddressChanged event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(shipAddress: event.shipAddress ?? state.shipAddress));
  }

  void _onSignUpFormPassToggled(
    SignUpFormPassToggled event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void _onSignUpFormAutovalidateEnabled(
    SignUpFormAutovalidateEnabled event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
