part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final Wishlist wishlist;
  final WishlistStatus status;
  final GCRError error;

  const WishlistState({
    required this.wishlist,
    required this.status,
    required this.error,
  });

  factory WishlistState.initial() {
    return WishlistState(
      wishlist: Wishlist(wishlistItems: <Product>[]),
      status: WishlistStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [wishlist, status, error];

  @override
  String toString() {
    return 'WishlistState(wishlist: $wishlist, status: $status, error: $error)';
  }

  WishlistState copyWith({
    Wishlist Function()? wishlist,
    WishlistStatus Function()? status,
    GCRError Function()? error,
  }) {
    return WishlistState(
      wishlist: wishlist != null ? wishlist() : this.wishlist,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
