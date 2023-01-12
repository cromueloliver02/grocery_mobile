import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'clear_cart_state.dart';

class ClearCartCubit extends Cubit<ClearCartState> {
  final CartRepository cartRepository;

  ClearCartCubit({
    required this.cartRepository,
  }) : super(ClearCartState.initial());

  void clearCart(String userId) async {
    emit(state.copyWith(status: () => ClearCartStatus.loading));

    try {
      emit(state.copyWith(
        status: () => ClearCartStatus.success,
      ));

      await cartRepository.clearCart(userId);
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => ClearCartStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void reset() => emit(ClearCartState.initial());
}
