import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/models.dart';

part 'viewed_recently_event.dart';
part 'viewed_recently_state.dart';

class ViewedRecentlyBloc
    extends HydratedBloc<ViewedRecentlyEvent, ViewedRecentlyState> {
  ViewedRecentlyBloc() : super(ViewedRecentlyState.initial()) {
    on<ViewedRecentlyItemAdded>(_onViewedRecentlyItemAdded);
    on<ViewedRecentlyResetRequested>(_onViewedRecentlyResetRequested);
  }

  void _onViewedRecentlyItemAdded(
    ViewedRecentlyItemAdded event,
    Emitter<ViewedRecentlyState> emit,
  ) {
    final Map<String, Product> viewedItems = {...state.viewedItems}
      ..putIfAbsent(event.product.id, () => event.product);

    emit(state.copyWith(viewedItems: () => viewedItems));
  }

  void _onViewedRecentlyResetRequested(
    ViewedRecentlyResetRequested event,
    Emitter<ViewedRecentlyState> emit,
  ) {
    emit(ViewedRecentlyState.initial());
  }

  @override
  ViewedRecentlyState? fromJson(Map<String, dynamic> json) {
    return ViewedRecentlyState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ViewedRecentlyState state) {
    return state.toMap();
  }
}
