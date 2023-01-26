import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../blocs/blocs.dart';
import '../../../utils/utils.dart';

part 'order_action_state.dart';

class OrderActionCubit extends Cubit<OrderActionState> {
  final OrderRepository orderRepository;

  OrderActionCubit({
    required this.orderRepository,
  }) : super(OrderActionState.initial());

  void placeOrder(OrderItem orderItem) async {
    emit(state.copyWith(status: () => OrderActionStatus.loading));

    try {
      // place order
      await orderRepository.placeOrder(orderItem);

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
