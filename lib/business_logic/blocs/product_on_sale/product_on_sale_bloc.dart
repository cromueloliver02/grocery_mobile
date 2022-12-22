import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'product_on_sale_event.dart';
part 'product_on_sale_state.dart';

class ProductOnSaleBloc extends Bloc<ProductOnSaleEvent, ProductOnSaleState> {
  ProductOnSaleBloc() : super(ProductOnSaleState.initial()) {
    on<ProductOnSaleStarted>(_onProductOnSaleStart);
  }

  void _onProductOnSaleStart(
    ProductOnSaleStarted event,
    Emitter<ProductOnSaleState> emit,
  ) {
    final List<Product> productsOnSale =
        event.productList.where((d) => d.isOnSale).toList();

    emit(state.copyWith(productsOnSale: productsOnSale));
  }
}
