// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
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
    required String userId,
    required Product product,
    required List<CartItem> cartItems,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final CartItem? existingCartItem = cartItems.firstWhereOrNull(
        (CartItem d) => d.product.id == product.id,
      );

      late final List<CartItem> newCartItems;

      if (existingCartItem != null) {
        // increment cart item's quantity
        newCartItems = cartItems
            .map((CartItem d) => d.product.id == product.id
                ? d.copyWith(quantity: () => d.quantity + 1)
                : d)
            .toList();
      } else {
        final CartItem cartItem = CartItem(
          id: uuid.v4(),
          product: product,
          quantity: 1,
        );

        // insert product to cart
        newCartItems = [cartItem, ...cartItems];
      }

      await cartRepository.addToCart(
        userId: userId,
        newCartItems: newCartItems,
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
    required String userId,
    required String cartItemId,
    required List<CartItem> cartItems,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final List<CartItem> newCartItems =
          cartItems.where((CartItem d) => d.id != cartItemId).toList();

      await cartRepository.removeFromCart(
        userId: userId,
        newCartItems: newCartItems,
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
    required String userId,
    required String cartItemId,
    required List<CartItem> cartItems,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final List<CartItem> newCartItems = cartItems
          .map((CartItem d) => d.id == cartItemId
              ? d.copyWith(quantity: () => d.quantity + 1)
              : d)
          .toList();

      await cartRepository.incrementCartItemQty(
        userId: userId,
        newCartItems: newCartItems,
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
    required String userId,
    required String cartItemId,
    required List<CartItem> cartItems,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final List<CartItem> newCartItems = cartItems
          .map((CartItem d) => d.id == cartItemId
              ? d.copyWith(quantity: () => d.quantity > 1 ? d.quantity - 1 : 1)
              : d)
          .toList();

      await cartRepository.incrementCartItemQty(
        userId: userId,
        newCartItems: newCartItems,
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

  void updateCartItemQty({
    required String userId,
    required String cartItemId,
    required List<CartItem> cartItems,
    required int newQuantity,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final List<CartItem> newCartItems = cartItems
          .map((CartItem d) =>
              d.id == cartItemId ? d.copyWith(quantity: () => newQuantity) : d)
          .toList();

      await cartRepository.updateCartItemQty(
        userId: userId,
        newCartItems: newCartItems,
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
