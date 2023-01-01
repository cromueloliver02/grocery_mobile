import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initial()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AuthSignoutRequested>(_onAuthSignoutRequested);
  }

  void _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) {
    authRepository.user.listen((fb_auth.User? user) {
      add(AuthUserChanged(user: user));
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    if (event.user == null) {
      emit(state.copyWith(
        user: null,
        status: AuthStatus.unauthenticated,
      ));
    }

    if (event.user != null) {
      emit(state.copyWith(
        user: event.user,
        status: AuthStatus.authenticated,
      ));
    }
  }

  void _onAuthSignoutRequested(
    AuthSignoutRequested event,
    Emitter<AuthState> emit,
  ) {
    authRepository.signout();
  }
}
