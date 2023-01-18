import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../utils/utils.dart';

part 'viewed_recently_event.dart';
part 'viewed_recently_state.dart';

class ViewedRecentlyBloc
    extends Bloc<ViewedRecentlyEvent, ViewedRecentlyState> {
  ViewedRecentlyBloc() : super(ViewedRecentlyState.initial()) {
    on<ViewedRecentlyStarted>(_onViewedRecentlyStarted);
    on<ViewedRecentlyItemAdded>(_onViewedRecentlyItemAdded);
    on<ViewedRecentlyResetRequested>(_onViewedRecentlyResetRequested);
  }

  void _onViewedRecentlyStarted(
    ViewedRecentlyStarted event,
    Emitter<ViewedRecentlyState> emit,
  ) async {
    emit(state.copyWith(status: () => ViewedRecentlyStatus.loading));

    try {
      // FETCH viewed recently items
      await Future.delayed(const Duration(seconds: 3));

      final Map<String, Product> viewedItems = {
        Product.productList[4].id: Product.productList[4],
        Product.productList[8].id: Product.productList[8],
        Product.productList[2].id: Product.productList[2],
      };

      emit(state.copyWith(
        status: () => ViewedRecentlyStatus.success,
        viewedItems: () => viewedItems,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => ViewedRecentlyStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onViewedRecentlyItemAdded(
    ViewedRecentlyItemAdded event,
    Emitter<ViewedRecentlyState> emit,
  ) {
    final Map<String, Product> viewedItems = state.viewedItems
      ..putIfAbsent(event.product.id, () => event.product);

    emit(state.copyWith(viewedItems: () => viewedItems));
  }

  void _onViewedRecentlyResetRequested(
    ViewedRecentlyResetRequested event,
    Emitter<ViewedRecentlyState> emit,
  ) {
    emit(ViewedRecentlyState.initial());
  }
}
