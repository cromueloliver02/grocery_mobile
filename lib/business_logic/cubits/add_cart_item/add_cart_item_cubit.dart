import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'add_cart_item_state.dart';

class AddCartItemCubit extends Cubit<AddCartItemState> {
  final CartRepository cartRepository;

  AddCartItemCubit({
    required this.cartRepository,
  }) : super(AddCartItemState.initial());

  void addToCart({
    required String userId,
    required Product product,
  }) async {
    emit(state.copyWith(status: AddCartItemStatus.loading));

    try {
      final CartItem cartItem = CartItem(
        id: '', // id is auto-generated in the backend
        product: product,
        quantity: 1,
        userId: userId,
      );

      // TODO: delete temporary code for testing
      await Future.delayed(const Duration(seconds: 3)); // ADD Cart item
      await cartRepository.addToCart(cartItem);

      emit(state.copyWith(
        status: AddCartItemStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: AddCartItemStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
