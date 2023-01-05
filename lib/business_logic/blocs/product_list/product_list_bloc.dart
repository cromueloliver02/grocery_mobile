import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository;

  ProductListBloc({
    required this.productRepository,
  }) : super(ProductListState.initial()) {
    on<ProductListStarted>(_onProductListStarted);
    on<ProductListFetched>(_onProductListFetched);
  }

  void _onProductListStarted(
    ProductListStarted event,
    Emitter<ProductListState> emit,
  ) {
    emit(state.copyWith(status: ProductListStatus.loading));

    try {
      productRepository.fetchProducts().listen((List<Product> products) {
        add(ProductListFetched(products: products));
      });

      emit(state.copyWith(status: ProductListStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ProductListStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onProductListFetched(
    ProductListFetched event,
    Emitter<ProductListState> emit,
  ) {
    emit(state.copyWith(productList: event.products));
  }
}
