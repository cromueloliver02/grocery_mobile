import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({
    required this.cartRepository,
  }) : super(CartState.initial()) {
    on<CartLoaded>(_onCartLoaded);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartItemIncremented>(_onCartItemIncremented);
    on<CartItemDecremented>(_onCartItemDecremented);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartCleared>(_onCartCleared);
  }

  void _onCartLoaded(CartLoaded event, Emitter<CartState> emit) async {
    emit(state.copyWith(cart: () => event.cart));
  }

  void _onCartItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    List<CartItem> cartItems = [];

    final bool isExist = state.cart.cartItems
        .any((d) => d.product.id == event.cartItem.product.id);

    if (isExist) {
      cartItems = state.cart.cartItems
          .map((d) => d.product.id == event.cartItem.product.id
              ? d.copyWith(quantity: () => d.quantity + 1)
              : d)
          .toList();
    } else {
      cartItems = [event.cartItem, ...state.cart.cartItems];
    }

    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => cartItems),
    ));
  }

  void _onCartItemIncremented(
      CartItemIncremented event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: () => CartFormStatus.loading));

    try {
      // disabled to change backend infrastracture of cart
      // final List<CartItem> cartItems = state.cart.cartItems
      //     .map((d) =>
      //         d.id == event.id ? d.copyWith(quantity: () => d.quantity + 1) : d)
      //     .toList();

      // emit(state.copyWith(
      //   formStatus: () => CartFormStatus.success,
      //   cart: Cart(cartItems: () => cartItems),
      // ));

      await Future.delayed(const Duration(seconds: 3)); // INCREMENT Cart item
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => CartFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onCartItemDecremented(
      CartItemDecremented event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: () => CartFormStatus.loading));

    try {
      // disabled to change backend infrastracture of cart
      // final List<CartItem> cartItems = state.cart.cartItems
      //     .map((d) =>
      //         d.id == event.id ? d.copyWith(quantity: () => d.quantity - 1) : d)
      //     .toList();

      // emit(state.copyWith(
      //   formStatus: () => CartFormStatus.success,
      //   cart: () => Cart(cartItems: cartItems),
      // ));

      // await Future.delayed(const Duration(seconds: 3)); // DECREMENT Cart item
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => CartFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onCartItemRemoved(
      CartItemRemoved event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: () => CartFormStatus.loading));

    try {
      // disabled to change backend infrastracture of cart
      // final List<CartItem> cartItems =
      //     state.cart.cartItems.where((d) => d.id != event.id).toList();

      // emit(state.copyWith(
      //   formStatus: () => CartFormStatus.success,
      //   cart: () => Cart(cartItems: cartItems),
      // ));

      // await Future.delayed(const Duration(seconds: 3)); // DELETE Cart item
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => CartFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onCartCleared(CartCleared event, Emitter<CartState> emit) async {
    emit(state.copyWith(formStatus: () => CartFormStatus.loading));

    try {
      // disabled to change backend infrastracture of cart
      // emit(state.copyWith(
      //   formStatus: () => CartFormStatus.success,
      //   cart: () => Cart(cartItems: []),
      // ));

      // await Future.delayed(const Duration(seconds: 3)); // CLEAR Cart
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => CartFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
