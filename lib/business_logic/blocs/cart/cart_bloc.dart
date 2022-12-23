import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<CartStarted>(_onStartCart);
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
}
