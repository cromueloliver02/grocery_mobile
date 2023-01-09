import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository;

  ProductListBloc({
    required this.productRepository,
  }) : super(ProductListState.initial()) {
    on<ProductListLoaded>(_onProductListLoaded);
  }

  void _onProductListLoaded(
    ProductListLoaded event,
    Emitter<ProductListState> emit,
  ) {
    emit(state.copyWith(productList: event.productList));
  }
}
