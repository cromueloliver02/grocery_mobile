import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

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
    on<CartItemQtyUpdated>(_onCartItemQtyUpdated);
    on<CartCleared>(_onCartCleared);
    on<CartResetRequested>(_onCartResetRequested);
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
    CartItemIncremented event,
    Emitter<CartState> emit,
  ) async {
    final List<CartItem> cartItems = state.cart.cartItems
        .map((d) => d.id == event.cartItemId
            ? d.copyWith(quantity: () => d.quantity + 1)
            : d)
        .toList();

    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => cartItems),
    ));
  }

  void _onCartItemDecremented(
    CartItemDecremented event,
    Emitter<CartState> emit,
  ) async {
    final List<CartItem> cartItems = state.cart.cartItems
        .map((d) => d.id == event.cartItemId
            ? d.copyWith(quantity: () => d.quantity - 1)
            : d)
        .toList();

    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => cartItems),
    ));
  }

  void _onCartItemQtyUpdated(
    CartItemQtyUpdated event,
    Emitter<CartState> emit,
  ) async {
    final List<CartItem> cartItems = state.cart.cartItems
        .map((d) => d.id == event.cartItemId
            ? d.copyWith(quantity: () => event.newQuantity)
            : d)
        .toList();

    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => cartItems),
    ));
  }

  void _onCartItemRemoved(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) async {
    final List<CartItem> cartItems =
        state.cart.cartItems.where((d) => d.id != event.cartItemId).toList();

    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => cartItems),
    ));
  }

  void _onCartCleared(CartCleared event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      cart: () => state.cart.copyWith(cartItems: () => <CartItem>[]),
    ));
  }

  void _onCartResetRequested(
    CartResetRequested event,
    Emitter<CartState> emit,
  ) {
    emit(CartState.initial());
  }
}
