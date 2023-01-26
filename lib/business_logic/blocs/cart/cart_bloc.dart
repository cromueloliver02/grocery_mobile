import 'package:cloud_firestore/cloud_firestore.dart';
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
    on<CartResetRequested>(_onCartResetRequested);
  }

  void _onCartLoaded(
    CartLoaded event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: () => CartStatus.loading));

    try {
      await emit.forEach<Cart>(
        cartRepository.getCart(event.userId),
        onData: (Cart cart) => state.copyWith(
          status: () => CartStatus.success,
          cart: () => cart,
        ),
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onCartResetRequested(
    CartResetRequested event,
    Emitter<CartState> emit,
  ) {
    emit(CartState.initial());
  }

  CartState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => CartStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => CartStatus.failure,
        error: () => GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      GCRError(
        code: 'Something went wrong',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
        stackTrace: stacktrace,
      ),
    );

    return state.copyWith(
      status: () => CartStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
