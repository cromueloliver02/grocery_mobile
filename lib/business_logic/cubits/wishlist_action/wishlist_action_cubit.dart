import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'wishlist_action_state.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  final WishlistRepository wishlistRepository;

  WishlistActionCubit({
    required this.wishlistRepository,
  }) : super(WishlistActionState.initial());

  void toggleWishlist({
    required bool isExist,
    required String userId,
    required Product product,
    required List<WishlistItem> wishlistItems,
  }) async {
    emit(state.copyWith(status: () => WishlistActionStatus.loading));

    try {
      if (isExist) {
        final List<WishlistItem> newWishlistItems = wishlistItems
            .where((WishlistItem d) => d.product.id != product.id)
            .toList();

        // remove wishlist item
        await wishlistRepository.removeFromWishlist(
          userId: userId,
          newWishlistItems: newWishlistItems,
        );

        emit(state.copyWith(
          actionType: () => WishlistActionType.remove,
          status: () => WishlistActionStatus.success,
        ));
      } else {
        final WishlistItem newWishlistItem = WishlistItem(
          id: uuid.v4(),
          product: product,
        );

        final List<WishlistItem> newWishlistItems = [
          newWishlistItem,
          ...wishlistItems,
        ];

        // add wishlist item
        await wishlistRepository.addToWishlist(
          userId: userId,
          newWishlistItems: newWishlistItems,
        );

        emit(state.copyWith(
          actionType: () => WishlistActionType.add,
          status: () => WishlistActionStatus.success,
        ));
      }
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void clearWishlist(String userId) async {
    emit(state.copyWith(status: () => WishlistActionStatus.loading));

    try {
      // clear wishlist items
      await wishlistRepository.clearWishlist(userId);

      emit(state.copyWith(
        status: () => WishlistActionStatus.success,
        actionType: () => WishlistActionType.clear,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => WishlistActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void reset() => emit(WishlistActionState.initial());
}
