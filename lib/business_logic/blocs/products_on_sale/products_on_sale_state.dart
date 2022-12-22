part of 'products_on_sale_bloc.dart';

class ProductsOnSaleState extends Equatable {
  final List<Product> productsOnSale;

  const ProductsOnSaleState({
    required this.productsOnSale,
  });

  factory ProductsOnSaleState.initial() {
    return const ProductsOnSaleState(productsOnSale: <Product>[]);
  }

  @override
  List<Object> get props => [productsOnSale];

  @override
  String toString() => 'ProductsOnSaleState(productsOnSale: $productsOnSale)';

  ProductsOnSaleState copyWith({
    List<Product>? productsOnSale,
  }) {
    return ProductsOnSaleState(
      productsOnSale: productsOnSale ?? this.productsOnSale,
    );
  }
}
