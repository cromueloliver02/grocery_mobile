part of 'product_on_sale_bloc.dart';

abstract class ProductOnSaleEvent extends Equatable {
  const ProductOnSaleEvent();

  @override
  List<Object> get props => [];
}

class ProductOnSaleStarted extends ProductOnSaleEvent {
  final List<Product> productList;

  const ProductOnSaleStarted({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}
