import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'viewed_recently_action_state.dart';

class ViewedRecentlyActionCubit extends Cubit<ViewedRecentlyActionState> {
  final ViewedRecentlyBloc viewedRecentlyBloc;

  ViewedRecentlyActionCubit({
    required this.viewedRecentlyBloc,
  }) : super(ViewedRecentlyActionState.initial());

  void addItem(Product product) async {
    emit(state.copyWith(status: () => ViewedRecentlyActionStatus.loading));

    try {
      // TODO: create backend functionality
      // POST viewed recently item
      await Future.delayed(const Duration(seconds: 3));

      viewedRecentlyBloc.add(ViewedRecentlyItemAdded(product: product));

      emit(state.copyWith(
        status: () => ViewedRecentlyActionStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => ViewedRecentlyActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }
}
