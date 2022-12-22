import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'product_feed_event.dart';
part 'product_feed_state.dart';

class ProductFeedBloc extends Bloc<ProductFeedEvent, ProductFeedState> {
  ProductFeedBloc() : super(ProductFeedState.initial()) {
    on<ProductFeedStarted>(_onProductFeedStarted);
  }

  void _onProductFeedStarted(
    ProductFeedStarted event,
    Emitter<ProductFeedState> emit,
  ) async {
    emit(state.copyWith(status: ProductFeedStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        productFeeds: Product.productFeeds,
        status: ProductFeedStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ProductFeedStatus.failure,
        error: err,
      ));
    }
  }
}
