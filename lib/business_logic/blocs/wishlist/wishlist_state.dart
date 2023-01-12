part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final Wishlist wishlist;
  final WishlistStatus status;
  final WishlistFormStatus formStatus;
  final GCRError error;

  const WishlistState({
    required this.wishlist,
    required this.status,
    required this.formStatus,
    required this.error,
  });

  factory WishlistState.initial() {
    return WishlistState(
      wishlist: Wishlist(wishlistItems: <Product>[]),
      status: WishlistStatus.initial,
      formStatus: WishlistFormStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [wishlist, status, formStatus, error];

  @override
  String toString() {
    return 'WishlistState(wishlist: $wishlist, status: $status, formStatus: $formStatus, error: $error)';
  }

  WishlistState copyWith({
    Wishlist Function()? wishlist,
    WishlistStatus Function()? status,
    WishlistFormStatus Function()? formStatus,
    GCRError Function()? error,
  }) {
    return WishlistState(
      wishlist: wishlist != null ? wishlist() : this.wishlist,
      status: status != null ? status() : this.status,
      formStatus: formStatus != null ? formStatus() : this.formStatus,
      error: error != null ? error() : this.error,
    );
  }
}
