import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../blocs/blocs.dart';
import '../cubits.dart';
import '../../../utils/utils.dart';

part 'order_action_state.dart';

class OrderActionCubit extends Cubit<OrderActionState> {
  final OrderBloc orderBloc;
  final CartActionCubit cartActionCubit;

  OrderActionCubit({
    required this.orderBloc,
    required this.cartActionCubit,
  }) : super(OrderActionState.initial());

  void placeOrder({
    required String userId,
    required OrderItem orderItem,
  }) async {
    emit(state.copyWith(status: () => OrderActionStatus.loading));

    try {
      // place order
      await Future.delayed(const Duration(seconds: 3));

      orderBloc.add(OrderPlaceRequested(orderItem: orderItem));
      cartActionCubit.clearCart(
        userId: userId,
        actionType: CartActionType.placeOrder,
      );

      emit(state.copyWith(
        status: () => OrderActionStatus.success,
        actionType: () => OrderActionType.placeOrder,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => OrderActionStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void reset() => emit(OrderActionState.initial());
}
