import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'decrement_cart_item_state.dart';

class DecrementCartItemCubit extends Cubit<DecrementCartItemState> {
  final CartRepository cartRepository;

  DecrementCartItemCubit({
    required this.cartRepository,
  }) : super(DecrementCartItemState.initial());

  void decrementCartItem({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => DecrementCartItemStatus.loading));

    try {
      emit(state.copyWith(
        cartItemId: () => cartItemId,
        status: () => DecrementCartItemStatus.success,
      ));

      await cartRepository.changeCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        action: CartItemQtyAction.decrement,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => DecrementCartItemStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void reset() => emit(DecrementCartItemState.initial());
}
