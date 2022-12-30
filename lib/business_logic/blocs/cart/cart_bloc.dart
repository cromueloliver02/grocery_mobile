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
    on<CartItemIncremented>(_onIncrementCartItem);
    on<CartItemDecremented>(_onDecrementCartItem);
    on<CartItemRemoved>(_onRemoveCartItem);
    on<CartCleared>(_onClearCart);
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

      if (isExist) {
        await Future.delayed(const Duration(seconds: 3)); // INCREASE Cart item
      } else {
        await Future.delayed(const Duration(seconds: 3)); // POST Cart item
      }
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: CartFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onIncrementCartItem(
      CartItemIncremented event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: CartFormStatus.loading));

    try {
      final List<CartItem> cartItems = state.cart.cartItems
          .map((d) =>
              d.id == event.id ? d.copyWith(quantity: d.quantity + 1) : d)
          .toList();

      emit(state.copyWith(
        formStatus: CartFormStatus.success,
        cart: Cart(cartItems: cartItems),
      ));

      await Future.delayed(const Duration(seconds: 3)); // INCREMENT Cart item
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: CartFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onDecrementCartItem(
      CartItemDecremented event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: CartFormStatus.loading));

    try {
      final List<CartItem> cartItems = state.cart.cartItems
          .map((d) =>
              d.id == event.id ? d.copyWith(quantity: d.quantity - 1) : d)
          .toList();

      emit(state.copyWith(
        formStatus: CartFormStatus.success,
        cart: Cart(cartItems: cartItems),
      ));

      await Future.delayed(const Duration(seconds: 3)); // DECREMENT Cart item
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

  void _onClearCart(CartCleared event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: CartFormStatus.loading));

    try {
      emit(state.copyWith(
        formStatus: CartFormStatus.success,
        cart: Cart(cartItems: []),
      ));

      await Future.delayed(const Duration(seconds: 3)); // CLEAR Cart
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: CartFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}