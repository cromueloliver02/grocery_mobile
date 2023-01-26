import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  final CartRepository cartRepository;

  CartActionCubit({
    required this.cartRepository,
  }) : super(CartActionState.initial());

  void addToCart({
    required Product product,
    required Cart cart,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final CartItem cartItem = CartItem(
        id: uuid.v4(),
        product: product,
        quantity: 1,
      );

      await cartRepository.addToCart(
        cartItem: cartItem,
        cart: cart,
      );

      emit(state.copyWith(
        actionType: () => CartActionType.addToCart,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void removeFromCart({
    required Cart cart,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      await cartRepository.removeFromCart(
        cartItemId: cartItemId,
        cart: cart,
      );

      emit(state.copyWith(
        actionType: () => CartActionType.removeFromCart,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void incrementCartItem({
    required String cartItemId,
    required Cart cart,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      await cartRepository.changeCartItemQty(
        cartItemId: cartItemId,
        cart: cart,
        action: CartItemQtyAction.increment,
      );

      emit(state.copyWith(
        actionType: () => CartActionType.incrementQty,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void decrementCartItem({
    required String cartItemId,
    required Cart cart,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      await cartRepository.changeCartItemQty(
        cartItemId: cartItemId,
        cart: cart,
        action: CartItemQtyAction.decrement,
      );

      emit(state.copyWith(
        actionType: () => CartActionType.decrementQty,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void updateCartItemQty({
    required String cartItemId,
    required Cart cart,
    required int newQuantity,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      await cartRepository.updateCartItemQty(
        cartItemId: cartItemId,
        cart: cart,
        newQuantity: newQuantity,
      );

      emit(state.copyWith(
        actionType: () => CartActionType.updateQty,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void clearCart({
    required Cart cart,
    required CartActionType actionType,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      await cartRepository.clearCart(cart);

      emit(state.copyWith(
        actionType: () => actionType,
        status: () => CartActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void reset() => emit(CartActionState.initial());
}
