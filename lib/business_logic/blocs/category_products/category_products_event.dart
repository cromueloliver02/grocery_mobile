part of 'category_products_bloc.dart';

abstract class CategoryProductsEvent extends Equatable {
  const CategoryProductsEvent();

  @override
  List<Object> get props => [];
}

class CategoryProductsSetted extends CategoryProductsEvent {
  final String category;

  const CategoryProductsSetted({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
