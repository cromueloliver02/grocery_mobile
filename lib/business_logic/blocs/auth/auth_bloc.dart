import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
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
    on<AuthSignoutRequested>(_onAuthSignoutRequested);
  }

  void _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) async {
    try {
      await emit.forEach<fb_auth.User?>(
        authRepository.user,
        onData: (fb_auth.User? user) {
          if (user == null) {
            return state.copyWith(
              user: () => null,
              status: () => AuthStatus.unauthenticated,
            );
          }

          return state.copyWith(
            user: () => user,
            status: () => AuthStatus.authenticated,
          );
        },
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => AuthStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onAuthSignoutRequested(
    AuthSignoutRequested event,
    Emitter<AuthState> emit,
  ) {
    authRepository.signout();
  }

  AuthState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => AuthStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => AuthStatus.failure,
        error: () => GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
        stackTrace: stacktrace,
      ),
    );

    return state.copyWith(
      status: () => AuthStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
