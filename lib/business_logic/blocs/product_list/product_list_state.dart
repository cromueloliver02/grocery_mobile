part of 'product_list_bloc.dart';

class ProductListState extends Equatable {
  final List<Product> productList;
  final ProductListStatus status;
  final GCRError error;

  const ProductListState({
    required this.productList,
    required this.status,
    required this.error,
  });

  factory ProductListState.initial() {
    return const ProductListState(
      productList: <Product>[],
      status: ProductListStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [productList, status, error];

  @override
  String toString() =>
      'ProductListState(productList: $productList, status: $status, error: $error)';

  ProductListState copyWith({
    List<Product> Function()? productList,
    ProductListStatus Function()? status,
    GCRError Function()? error,
  }) {
    return ProductListState(
      productList: productList != null ? productList() : this.productList,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
