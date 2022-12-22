part of 'product_feed_bloc.dart';

abstract class ProductFeedEvent extends Equatable {
  const ProductFeedEvent();

  @override
  List<Object> get props => [];
}

class ProductFeedStarted extends ProductFeedEvent {}
