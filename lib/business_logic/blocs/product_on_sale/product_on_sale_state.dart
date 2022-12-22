part of 'product_on_sale_bloc.dart';

class ProductOnSaleState extends Equatable {
  final List<Product> productsOnSale;

  const ProductOnSaleState({
    required this.productsOnSale,
  });

  factory ProductOnSaleState.initial() {
    return const ProductOnSaleState(productsOnSale: <Product>[]);
  }

  @override
  List<Object> get props => [productsOnSale];

  @override
  String toString() => 'ProductOnSaleState(productsOnSale: $productsOnSale)';

  ProductOnSaleState copyWith({
    List<Product>? productsOnSale,
  }) {
    return ProductOnSaleState(
      productsOnSale: productsOnSale ?? this.productsOnSale,
    );
  }
}
