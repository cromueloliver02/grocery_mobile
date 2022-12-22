part of 'category_products_bloc.dart';

class CategoryProductsState extends Equatable {
  final List<Product> categoryProducts;

  const CategoryProductsState({
    required this.categoryProducts,
  });

  factory CategoryProductsState.initial() {
    return const CategoryProductsState(categoryProducts: <Product>[]);
  }

  @override
  List<Object> get props => [categoryProducts];

  @override
  String toString() =>
      'CategoryProductsState(categoryProducts: $categoryProducts)';

  CategoryProductsState copyWith({
    List<Product>? categoryProducts,
  }) {
    return CategoryProductsState(
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }
}
