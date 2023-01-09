part of 'products_on_sale_bloc.dart';

abstract class ProductsOnSaleEvent extends Equatable {
  const ProductsOnSaleEvent();

  @override
  List<Object> get props => [];
}

class ProductsOnSaleLoaded extends ProductsOnSaleEvent {
  final List<Product> onSaleProducts;

  const ProductsOnSaleLoaded({
    required this.onSaleProducts,
  });

  @override
  List<Object> get props => [onSaleProducts];
}
