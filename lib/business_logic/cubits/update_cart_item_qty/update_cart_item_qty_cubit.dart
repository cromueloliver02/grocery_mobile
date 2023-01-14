import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'update_cart_item_qty_state.dart';

class UpdateCartItemQtyCubit extends Cubit<UpdateCartItemQtyState> {
  final CartRepository cartRepository;

  UpdateCartItemQtyCubit({
    required this.cartRepository,
  }) : super(UpdateCartItemQtyState.initial());

  void updateCartItemQty({
    required String userId,
    required String cartItemId,
    required int newQuantity,
  }) async {
    emit(state.copyWith(status: () => UpdateCartItemQtyStatus.loading));

    try {
      emit(state.copyWith(
        status: () => UpdateCartItemQtyStatus.success,
        cartItemId: () => cartItemId,
        newQuantity: () => newQuantity,
      ));

      await cartRepository.updateCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        newQuantity: newQuantity,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => UpdateCartItemQtyStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
