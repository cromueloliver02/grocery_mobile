part of 'products_on_sale_bloc.dart';

class ProductsOnSaleState extends Equatable {
  final List<Product> onSaleProducts;

  const ProductsOnSaleState({
    required this.onSaleProducts,
  });

  factory ProductsOnSaleState.initial() {
    return const ProductsOnSaleState(onSaleProducts: <Product>[]);
  }

  @override
  List<Object> get props => [onSaleProducts];

  @override
  String toString() => 'ProductsOnSaleState(onSaleProducts: $onSaleProducts)';

  ProductsOnSaleState copyWith({
    List<Product> Function()? onSaleProducts,
  }) {
    return ProductsOnSaleState(
      onSaleProducts:
          onSaleProducts != null ? onSaleProducts() : this.onSaleProducts,
    );
  }
}
