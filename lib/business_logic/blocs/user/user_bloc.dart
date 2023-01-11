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
    on<UserLoaded>(_onUserLoaded);
    on<UserShipAddressUpdated>(_onShipAddressUpdated);
  }

  void _onUserLoaded(
    UserLoaded event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(user: event.user));
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
