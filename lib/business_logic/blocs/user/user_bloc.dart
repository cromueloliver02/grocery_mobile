import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<UserLoaded>(_onUserLoaded);
    on<UserAddressUpdated>(_onUserAddressUpdated);
    on<UserResetRequested>(_onUserResetRequested);
  }

  void _onUserLoaded(
    UserLoaded event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(user: () => event.user));
  }

  void _onUserAddressUpdated(
    UserAddressUpdated event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
      user: () => state.user.copyWith(shipAddress: () => event.shipAddress),
    ));
  }

  void _onUserResetRequested(
    UserResetRequested event,
    Emitter<UserState> emit,
  ) {
    emit(UserState.initial());
  }
}
