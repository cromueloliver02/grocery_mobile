import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'products_on_sale_event.dart';
part 'products_on_sale_state.dart';

class ProductsOnSaleBloc
    extends Bloc<ProductsOnSaleEvent, ProductsOnSaleState> {
  ProductsOnSaleBloc() : super(ProductsOnSaleState.initial()) {
    on<ProductsOnSaleStarted>(_onProductOnSaleStart);
  }

  void _onProductOnSaleStart(
    ProductsOnSaleStarted event,
    Emitter<ProductsOnSaleState> emit,
  ) {
    final List<Product> productsOnSale =
        event.productList.where((d) => d.isOnSale).toList();

    emit(state.copyWith(productsOnSale: productsOnSale));
  }
}
