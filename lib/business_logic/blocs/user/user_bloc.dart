import 'package:flutter/foundation.dart';
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
    on<UserShipAddressUpdated>(_onShipAddressUpdated);
  }

  void _onUserStarted(
    UserStarted event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    try {
      final User user = await userRepository.fetchUser(userId: event.userId);

      emit(state.copyWith(
        status: UserStatus.success,
        user: user,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: UserStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onShipAddressUpdated(
    UserShipAddressUpdated event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(formStatus: UserFormStatus.loading));

    try {
      await userRepository.updateShipAddress(
        userId: state.user.id,
        shipAddress: event.shipAddress,
      );

      emit(state.copyWith(formStatus: UserFormStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: UserFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
