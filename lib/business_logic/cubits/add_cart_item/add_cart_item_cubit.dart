import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'add_cart_item_state.dart';

const _uuid = Uuid();

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
        id: _uuid.v4(),
        product: product,
        quantity: 1,
      );

      final CartItem newCartItem = await cartRepository.addToCart(
        userId: userId,
        cartItem: cartItem,
      );

      emit(state.copyWith(
        status: AddCartItemStatus.success,
        cartItem: newCartItem,
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
