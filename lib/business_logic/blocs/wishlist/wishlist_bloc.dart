import 'package:cloud_firestore/cloud_firestore.dart';
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
    on<WishlistResetRequested>(_onWishlistResetRequested);
  }

  void _onWishlistStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: () => WishlistStatus.loading));

    try {
      await emit.forEach<Wishlist>(
        wishlistRepository.getWishlist(event.userId),
        onData: (Wishlist wishlist) => state.copyWith(
          wishlist: () => wishlist,
          status: () => WishlistStatus.success,
        ),
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onWishlistResetRequested(
    WishlistResetRequested event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistState.initial());
  }

  WishlistState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => WishlistStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => WishlistStatus.failure,
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
      status: () => WishlistStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
