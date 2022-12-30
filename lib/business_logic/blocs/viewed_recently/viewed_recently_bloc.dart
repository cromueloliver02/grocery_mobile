import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../presentation/utils/utils.dart';

part 'viewed_recently_event.dart';
part 'viewed_recently_state.dart';

class ViewedRecentlyBloc
    extends Bloc<ViewedRecentlyEvent, ViewedRecentlyState> {
  ViewedRecentlyBloc() : super(ViewedRecentlyState.initial()) {
    on<ViewedRecentlyStarted>(_onStartViewedRecently);
  }

  void _onStartViewedRecently(
    ViewedRecentlyStarted event,
    Emitter<ViewedRecentlyState> emit,
  ) async {
    emit(state.copyWith(status: ViewedRecentlyStatus.loading));

    try {
      // FETCH viewed recently items
      await Future.delayed(const Duration(seconds: 3));

      final List<Product> viewedItems = [
        Product.productList[4],
        Product.productList[8],
        Product.productList[2],
      ];

      emit(state.copyWith(
        status: ViewedRecentlyStatus.success,
        viewedItems: viewedItems,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ViewedRecentlyStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
