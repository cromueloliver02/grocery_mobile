import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'products_on_sale_event.dart';
part 'products_on_sale_state.dart';

class ProductsOnSaleBloc
    extends Bloc<ProductsOnSaleEvent, ProductsOnSaleState> {
  ProductsOnSaleBloc() : super(ProductsOnSaleState.initial()) {
    on<ProductsOnSaleLoaded>(_onProductOnSaleLoaded);
    on<ProductsOnSaleResetRequested>(_onProductsOnSaleResetRequested);
  }

  void _onProductOnSaleLoaded(
    ProductsOnSaleLoaded event,
    Emitter<ProductsOnSaleState> emit,
  ) {
    emit(state.copyWith(onSaleProducts: () => event.onSaleProducts));
  }

  void _onProductsOnSaleResetRequested(
    ProductsOnSaleResetRequested event,
    Emitter<ProductsOnSaleState> emit,
  ) {
    emit(ProductsOnSaleState.initial());
  }
}
