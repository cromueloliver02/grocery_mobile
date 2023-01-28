import 'package:equatable/equatable.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'user_action_state.dart';

class UserActionCubit extends Cubit<UserActionState> {
  final UserRepository userRepository;

  UserActionCubit({
    required this.userRepository,
  }) : super(UserActionState.initial());

  void updateShipAddress({
    required String userId,
    required String newShipAddress,
  }) async {
    emit(state.copyWith(status: () => UserActionStatus.loading));

    try {
      await userRepository.updateShipAddress(
        userId: userId,
        shipAddress: newShipAddress,
      );

      emit(state.copyWith(status: () => UserActionStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => UserActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void reset() => emit(UserActionState.initial());
}
