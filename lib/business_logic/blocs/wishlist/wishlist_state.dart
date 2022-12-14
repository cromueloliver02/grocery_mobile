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
    Wishlist? wishlist,
    WishlistStatus? status,
    WishlistFormStatus? formStatus,
    GCRError? error,
  }) {
    return WishlistState(
      wishlist: wishlist ?? this.wishlist,
      status: status ?? this.status,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
