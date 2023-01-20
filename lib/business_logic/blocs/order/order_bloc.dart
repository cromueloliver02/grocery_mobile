import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../utils/utils.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.initial()) {
    on<OrderStarted>(_onOrderStarted);
    on<OrderPlaceRequested>(_onOrderPlaceRequested);
    on<OrderResetRequested>(_onOrderResetRequested);
  }

  void _onOrderStarted(OrderStarted event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: () => OrderStatus.loading));

    try {
      // fetch order
      await Future.delayed(const Duration(seconds: 3));

      final Order order = Order(orderItems: OrderItem.orderItems);

      emit(state.copyWith(
        status: () => OrderStatus.success,
        order: () => order,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => OrderStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onOrderPlaceRequested(
    OrderPlaceRequested event,
    Emitter<OrderState> emit,
  ) {
    final List<OrderItem> orderItems = [
      event.orderItem,
      ...state.order.orderItems,
    ];

    emit(state.copyWith(
      order: () => state.order.copyWith(
        orderItems: () => orderItems,
      ),
    ));
  }

  void _onOrderResetRequested(
    OrderResetRequested event,
    Emitter<OrderState> emit,
  ) {
    emit(OrderState.initial());
  }
}
