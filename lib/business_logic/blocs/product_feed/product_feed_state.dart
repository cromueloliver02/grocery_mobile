part of 'product_feed_bloc.dart';

class ProductFeedState extends Equatable {
  final List<Product> productFeeds;
  final ProductFeedStatus status;
  final GCRError error;

  const ProductFeedState({
    required this.productFeeds,
    required this.status,
    required this.error,
  });

  factory ProductFeedState.initial() {
    return const ProductFeedState(
      productFeeds: <Product>[],
      status: ProductFeedStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [productFeeds, status, error];

  @override
  String toString() =>
      'ProductFeedState(productFeeds: $productFeeds, status: $status, error: $error)';

  ProductFeedState copyWith({
    List<Product>? productFeeds,
    ProductFeedStatus? status,
    GCRError? error,
  }) {
    return ProductFeedState(
      productFeeds: productFeeds ?? this.productFeeds,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
