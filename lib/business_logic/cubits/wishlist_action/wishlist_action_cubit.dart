import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'wishlist_action_state.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  final WishlistBloc wishlistBloc;
  final WishlistRepository wishlistRepository;

  WishlistActionCubit({
    required this.wishlistBloc,
    required this.wishlistRepository,
  }) : super(WishlistActionState.initial());

  void toggleWishlist({
    required String userId,
    required Product product,
  }) async {
    emit(state.copyWith(status: () => WishlistActionStatus.loading));

    try {
      final bool isExist = wishlistBloc.state.wishlist.wishlistItems
          .any((d) => d.id == product.id);

      if (isExist) {
        emit(state.copyWith(
          actionType: () => WishlistActionType.remove,
          status: () => WishlistActionStatus.success,
        ));

        // DELETE wishlist item
        await wishlistRepository.removeFromWishlist(
          userId: userId,
          productId: product.id,
        );
      } else {
        wishlistBloc.add(WishlistItemAdded(product: product));

        emit(state.copyWith(
          actionType: () => WishlistActionType.add,
          status: () => WishlistActionStatus.success,
        ));

        // POST wishlist item
        await wishlistRepository.addToWishlist(
          userId: userId,
          productId: product.id,
        );
      }
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
