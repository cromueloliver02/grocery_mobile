import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({
    required this.userRepository,
  }) : super(UserState.initial()) {
    on<UserLoaded>(_onUserLoaded);
    on<UserResetRequested>(_onUserResetRequested);
  }

  void _onUserLoaded(
    UserLoaded event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: () => UserStatus.loading));

    try {
      await emit.forEach<User>(
        userRepository.getUser(event.userId),
        onData: (User user) => state.copyWith(
          status: () => UserStatus.success,
          user: () => user,
        ),
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => UserStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onUserResetRequested(
    UserResetRequested event,
    Emitter<UserState> emit,
  ) {
    emit(UserState.initial());
  }

  UserState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => UserStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => UserStatus.failure,
        error: () => GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      GCRError(
        code: 'Something went wrong',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
        stackTrace: stacktrace,
      ),
    );

    return state.copyWith(
      status: () => UserStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
