import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'increment_cart_item_state.dart';

class IncrementCartItemCubit extends Cubit<IncrementCartItemState> {
  final CartRepository cartRepository;

  IncrementCartItemCubit({
    required this.cartRepository,
  }) : super(IncrementCartItemState.initial());

  void incrementCartItem({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => IncrementCartItemStatus.loading));

    try {
      emit(state.copyWith(
        cartItemId: () => cartItemId,
        status: () => IncrementCartItemStatus.success,
      ));

      await cartRepository.incrementCartItem(
        userId: userId,
        cartItemId: cartItemId,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => IncrementCartItemStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
