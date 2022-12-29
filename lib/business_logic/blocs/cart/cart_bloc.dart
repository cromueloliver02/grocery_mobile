import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'cart_event.dart';
part 'cart_state.dart';

const _uuid = Uuid();

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<CartStarted>(_onStartCart);
    on<CartItemAdded>(_onAddCartItem);
    on<CartItemRemoved>(_onRemoveCartItem);
  }

  void _onStartCart(CartStarted event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        status: CartStatus.success,
        cart: Cart(cartItems: CartItem.cartItems),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: CartStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onAddCartItem(CartItemAdded event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: CartFormStatus.loading));

    try {
      final Product product = event.product;

      final bool isExist =
          state.cart.cartItems.any((d) => d.product.id == product.id);

      List<CartItem> cartItems = <CartItem>[];

      if (isExist) {
        cartItems = state.cart.cartItems
            .map((d) => d.product.id == product.id
                ? d.copyWith(quantity: d.quantity + 1)
                : d)
            .toList();
      } else {
        await Future.delayed(const Duration(seconds: 3)); // POST Cart item

        final CartItem cartItem = CartItem(
          id: _uuid.v4(),
          product: product,
          quantity: 1,
          userId: 'cromuel-unique-id',
        );

        cartItems = [cartItem, ...state.cart.cartItems];
      }

      emit(state.copyWith(
        formStatus: CartFormStatus.success,
        cart: Cart(cartItems: cartItems),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: CartFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onRemoveCartItem(CartItemRemoved event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: CartFormStatus.loading));

    try {
      final List<CartItem> cartItems =
          state.cart.cartItems.where((d) => d.id != event.id).toList();

      emit(state.copyWith(
        formStatus: CartFormStatus.success,
        cart: Cart(cartItems: cartItems),
      ));

      await Future.delayed(const Duration(seconds: 3)); // DELETE Cart item
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: CartFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
