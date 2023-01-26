import 'package:cloud_firestore/cloud_firestore.dart';
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
    on<ProductListLoaded>(_onProductListLoaded);
    on<ProductListResetRequested>(_onProductListResetRequested);
  }

  void _onProductListLoaded(
    ProductListLoaded event,
    Emitter<ProductListState> emit,
  ) async {
    emit(state.copyWith(status: () => ProductListStatus.loading));

    try {
      await emit.forEach<List<Product>>(
        productRepository.fetchProducts(),
        onData: (List<Product> productList) => state.copyWith(
          status: () => ProductListStatus.success,
          productList: () => productList,
        ),
        onError: _onError,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => ProductListStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onProductListResetRequested(
    ProductListResetRequested event,
    Emitter<ProductListState> emit,
  ) {
    emit(ProductListState.initial());
  }

  ProductListState _onError(Object err, StackTrace stacktrace) {
    if (err is GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => ProductListStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, GCRError.firebaseException(err));

      return state.copyWith(
        status: () => ProductListStatus.failure,
        error: () => GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      GCRError(
        code: 'Something went wrong',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
        stackTrace: stacktrace,
      ),
    );

    return state.copyWith(
      status: () => ProductListStatus.failure,
      error: () => GCRError.exception(err),
    );
  }
}
