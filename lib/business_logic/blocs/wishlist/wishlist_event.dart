part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class WishlistStarted extends WishlistEvent {}

class WishlistItemAdded extends WishlistEvent {
  final Product product;

  const WishlistItemAdded({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
