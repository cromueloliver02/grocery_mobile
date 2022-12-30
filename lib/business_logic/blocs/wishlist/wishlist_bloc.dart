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
  }

  void _onStartWishlist(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      // FETCH wishlist products
      await Future.delayed(const Duration(seconds: 3));

      final List<Product> wishlist = [
        Product.productList[5],
        Product.productList[7],
        Product.productList[2],
      ];

      emit(state.copyWith(
        wishlist: wishlist,
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
}
