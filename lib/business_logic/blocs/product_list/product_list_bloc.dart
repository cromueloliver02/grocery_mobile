import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListState.initial()) {
    on<ProductListStarted>(_onProductListStarted);
  }

  void _onProductListStarted(
    ProductListStarted event,
    Emitter<ProductListState> emit,
  ) async {
    emit(state.copyWith(status: ProductListStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        productList: Product.productList,
        status: ProductListStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ProductListStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
