part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class WishlistStarted extends WishlistEvent {
  final String userId;

  const WishlistStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class WishlistResetRequested extends WishlistEvent {}
