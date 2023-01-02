import 'package:flutter/material.dart';
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
    on<UserStarted>(_onUserStarted);
  }

  void _onUserStarted(
    UserStarted event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    try {
      final User user = await userRepository.fetchUser(id: event.id);

      emit(state.copyWith(
        user: user,
        status: UserStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: UserStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
