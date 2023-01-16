import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'update_ship_address_state.dart';

class UpdateShipAddressCubit extends Cubit<UpdateShipAddressState> {
  final UserBloc userBloc;
  final UserRepository userRepository;

  UpdateShipAddressCubit({
    required this.userBloc,
    required this.userRepository,
  }) : super(UpdateShipAddressState.initial());

  void updateShipAddress({
    required String userId,
    required String newShipAddress,
  }) async {
    emit(state.copyWith(status: () => UpdateShipAddressStatus.loading));

    userBloc.add(UserAddressUpdated(shipAddress: newShipAddress));

    try {
      await userRepository.updateShipAddress(
        userId: userId,
        shipAddress: newShipAddress,
      );

      emit(state.copyWith(status: () => UpdateShipAddressStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => UpdateShipAddressStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
