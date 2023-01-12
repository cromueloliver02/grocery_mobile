import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../utils/utils.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState.initial()) {
    on<WishlistStarted>(_onWishlistStarted);
    on<WishlistAddedOrRemoved>(_onWishlistAddedOrRemoved);
    on<WishlistCleared>(_onWishlistCleared);
    on<WishlistResetRequested>(_onWishlistResetRequested);
  }

  void _onWishlistStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: () => WishlistStatus.loading));

    try {
      // FETCH wishlist products
      await Future.delayed(const Duration(seconds: 3));

      final List<Product> wishlistItems = [
        Product.productList[5],
        Product.productList[7],
        Product.productList[2],
      ];

      emit(state.copyWith(
        wishlist: () => Wishlist(wishlistItems: wishlistItems),
        status: () => WishlistStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onWishlistAddedOrRemoved(
    WishlistAddedOrRemoved event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(formStatus: () => WishlistFormStatus.loading));

    try {
      final Product product = event.product;

      final bool isExist =
          state.wishlist.wishlistItems.any((d) => d.id == product.id);

      if (isExist) {
        final List<Product> wishlistItems = state.wishlist.wishlistItems
            .where((d) => d.id != product.id)
            .toList();

        emit(state.copyWith(
          wishlist: () => Wishlist(wishlistItems: wishlistItems),
          formStatus: () => WishlistFormStatus.success,
        ));

        // DELETE wishlist item
        await Future.delayed(const Duration(seconds: 3));
      } else {
        final List<Product> wishlistItems = [
          event.product,
          ...state.wishlist.wishlistItems,
        ];

        emit(state.copyWith(
          wishlist: () => Wishlist(wishlistItems: wishlistItems),
          formStatus: () => WishlistFormStatus.success,
        ));

        // POST wishlist item
        await Future.delayed(const Duration(seconds: 3));
      }
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => WishlistFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onWishlistCleared(
    WishlistCleared event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(formStatus: () => WishlistFormStatus.loading));

    try {
      emit(state.copyWith(
        formStatus: () => WishlistFormStatus.success,
        wishlist: () => Wishlist(wishlistItems: []),
      ));

      await Future.delayed(const Duration(seconds: 3)); // CLEAR wishlist
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: () => WishlistFormStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onWishlistResetRequested(
    WishlistResetRequested event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistState.initial());
  }
}
