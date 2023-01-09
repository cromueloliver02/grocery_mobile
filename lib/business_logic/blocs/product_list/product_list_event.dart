part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListLoaded extends ProductListEvent {
  final List<Product> productList;

  const ProductListLoaded({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}
