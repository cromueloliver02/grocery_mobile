import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState.initial()) {
    on<WishlistStarted>(_onStartWishlist);
    on<WishlistItemAdded>(_onAddItemWishlist);
  }

  void _onStartWishlist(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      // FETCH wishlist products
      await Future.delayed(const Duration(seconds: 3));

      final List<Product> wishlistItems = [
        Product.productList[5],
        Product.productList[7],
        Product.productList[2],
      ];

      emit(state.copyWith(
        wishlist: Wishlist(wishlistItems: wishlistItems),
        status: WishlistStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: WishlistStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onAddItemWishlist(
    WishlistItemAdded event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(formStatus: WishlistFormStatus.loading));

    try {
      final List<Product> wishlistItems = [
        event.product,
        ...state.wishlist.wishlistItems,
      ];

      emit(state.copyWith(
        wishlist: Wishlist(wishlistItems: wishlistItems),
        formStatus: WishlistFormStatus.success,
      ));

      // POST wishlist product
      await Future.delayed(const Duration(seconds: 3));
    } on GCRError catch (err) {
      emit(state.copyWith(
        formStatus: WishlistFormStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
