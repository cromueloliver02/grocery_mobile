part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListStarted extends ProductListEvent {}

class ProductListFetched extends ProductListEvent {
  final List<Product> products;

  const ProductListFetched({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
