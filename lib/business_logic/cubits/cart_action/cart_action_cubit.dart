import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';
import '../../blocs/blocs.dart';

part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  final CartBloc cartBloc;
  final CartRepository cartRepository;

  CartActionCubit({
    required this.cartRepository,
    required this.cartBloc,
  }) : super(CartActionState.initial());

  void addToCart({
    required String userId,
    required Product product,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final CartItem cartItem = CartItem(
        id: uuid.v4(),
        product: product,
        quantity: 1,
      );

      final CartItem newCartItem = await cartRepository.addToCart(
        userId: userId,
        cartItem: cartItem,
      );

      cartBloc.add(CartItemAdded(cartItem: newCartItem));

      emit(state.copyWith(
        actionType: () => CartActionType.addToCart,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void removeFromCart({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      cartBloc.add(CartItemRemoved(cartItemId: cartItemId));

      emit(state.copyWith(
        actionType: () => CartActionType.removeFromCart,
        status: () => CartActionStatus.success,
      ));

      await cartRepository.removeFromCart(
        userId: userId,
        cartItemId: cartItemId,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void incrementCartItem({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      cartBloc.add(CartItemIncremented(cartItemId: cartItemId));

      emit(state.copyWith(
        actionType: () => CartActionType.incrementQty,
        status: () => CartActionStatus.success,
      ));

      await cartRepository.changeCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        action: CartItemQtyAction.increment,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void decrementCartItem({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      cartBloc.add(CartItemDecremented(cartItemId: cartItemId));

      emit(state.copyWith(
        actionType: () => CartActionType.decrementQty,
        status: () => CartActionStatus.success,
      ));

      await cartRepository.changeCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        action: CartItemQtyAction.decrement,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void clearCart(String userId) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      cartBloc.add(CartCleared());

      emit(state.copyWith(
        actionType: () => CartActionType.clearCart,
        status: () => CartActionStatus.success,
      ));

      await cartRepository.clearCart(userId);
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
