import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'category_products_event.dart';
part 'category_products_state.dart';

class CategoryProductsBloc
    extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  final List<Product> productList;

  CategoryProductsBloc({
    required this.productList,
  }) : super(CategoryProductsState.initial()) {
    on<CategoryProductsSetted>(_onSetCategoryProducts);
  }

  void _onSetCategoryProducts(
    CategoryProductsSetted event,
    Emitter<CategoryProductsState> emit,
  ) {
    final List<Product> categoryProducts =
        productList.where((d) => d.category == event.category).toList();

    emit(state.copyWith(categoryProducts: categoryProducts));
  }
}
