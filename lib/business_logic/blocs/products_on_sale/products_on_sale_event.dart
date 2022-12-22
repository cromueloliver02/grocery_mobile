part of 'products_on_sale_bloc.dart';

abstract class ProductsOnSaleEvent extends Equatable {
  const ProductsOnSaleEvent();

  @override
  List<Object> get props => [];
}

class ProductsOnSaleStarted extends ProductsOnSaleEvent {
  final List<Product> productList;

  const ProductsOnSaleStarted({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}
