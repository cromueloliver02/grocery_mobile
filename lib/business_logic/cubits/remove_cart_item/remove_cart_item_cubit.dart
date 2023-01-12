import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'remove_cart_item_state.dart';

class RemoveCartItemCubit extends Cubit<RemoveCartItemState> {
  final CartRepository cartRepository;

  RemoveCartItemCubit({
    required this.cartRepository,
  }) : super(RemoveCartItemState.initial());

  void removeFromCart({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => RemoveCartItemStatus.loading));

    try {
      await cartRepository.removeFromCart(
        userId: userId,
        cartItemId: cartItemId,
      );

      emit(state.copyWith(
        status: () => RemoveCartItemStatus.success,
        cartItemId: () => cartItemId,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => RemoveCartItemStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void reset() => emit(RemoveCartItemState.initial());
}
