part of 'product_list_bloc.dart';

class ProductListState extends Equatable {
  final List<Product> productList;

  const ProductListState({
    required this.productList,
  });

  factory ProductListState.initial() {
    return const ProductListState(
      productList: <Product>[],
    );
  }

  @override
  List<Object> get props => [productList];

  @override
  String toString() => 'ProductListState(productList: $productList)';

  ProductListState copyWith({
    List<Product> Function()? productList,
  }) {
    return ProductListState(
      productList: productList != null ? productList() : this.productList,
    );
  }
}
