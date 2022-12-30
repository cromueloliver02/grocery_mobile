part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final List<Product> wishlist;
  final WishlistStatus status;
  final GCRError error;

  const WishlistState({
    required this.wishlist,
    required this.status,
    required this.error,
  });

  factory WishlistState.initial() {
    return const WishlistState(
      wishlist: [],
      status: WishlistStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [wishlist, status, error];

  @override
  String toString() =>
      'WishlistState(wishlist: $wishlist, status: $status, error: $error)';

  WishlistState copyWith({
    List<Product>? wishlist,
    WishlistStatus? status,
    GCRError? error,
  }) {
    return WishlistState(
      wishlist: wishlist ?? this.wishlist,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
