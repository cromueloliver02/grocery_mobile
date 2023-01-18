import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository wishlistRepository;

  WishlistBloc({
    required this.wishlistRepository,
  }) : super(WishlistState.initial()) {
    on<WishlistStarted>(_onWishlistStarted);
    on<WishlistItemAdded>(_onWishlistItemAdded);
    on<WishlistCleared>(_onWishlistCleared);
    on<WishlistResetRequested>(_onWishlistResetRequested);
  }

  void _onWishlistStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: () => WishlistStatus.loading));

    try {
      // FETCH wishlist items
      final List<Product> wishlistItems =
          await wishlistRepository.fetchWishlistItems(event.userId);

      emit(state.copyWith(
        status: () => WishlistStatus.success,
        wishlist: () => state.wishlist.copyWith(
          wishlistItems: () => wishlistItems,
        ),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onWishlistItemAdded(
    WishlistItemAdded event,
    Emitter<WishlistState> emit,
  ) async {
    final List<Product> wishlistItems = [
      event.product,
      ...state.wishlist.wishlistItems,
    ];

    emit(state.copyWith(
      wishlist: () => state.wishlist.copyWith(
        wishlistItems: () => wishlistItems,
      ),
    ));
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
