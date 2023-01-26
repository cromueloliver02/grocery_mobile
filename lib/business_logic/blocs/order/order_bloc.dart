import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart' as model;
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({
    required this.orderRepository,
  }) : super(OrderState.initial()) {
    on<OrderStarted>(_onOrderStarted);
    on<OrderResetRequested>(_onOrderResetRequested);
  }

  void _onOrderStarted(OrderStarted event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: () => OrderStatus.loading));

    try {
      await emit.forEach<model.Order>(
        orderRepository.getOrder(event.userId),
        onData: (model.Order order) => state.copyWith(
          order: () => order,
          status: () => OrderStatus.success,
        ),
        onError: _onError,
      );
    } on model.GCRError catch (err) {
      emit(state.copyWith(
        status: () => OrderStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onOrderResetRequested(
    OrderResetRequested event,
    Emitter<OrderState> emit,
  ) {
    emit(OrderState.initial());
  }

  OrderState _onError(Object err, StackTrace stacktrace) {
    if (err is model.GCRError) {
      logError(state, err);

      return state.copyWith(
        status: () => OrderStatus.failure,
        error: () => err,
      );
    }

    if (err is FirebaseException) {
      logError(state, model.GCRError.firebaseException(err));

      return state.copyWith(
        status: () => OrderStatus.failure,
        error: () => model.GCRError.firebaseException(err),
      );
    }

    logError(
      state,
      model.GCRError(
        code: 'Something went wrong',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
        stackTrace: stacktrace,
      ),
    );

    return state.copyWith(
      status: () => OrderStatus.failure,
      error: () => model.GCRError.exception(err),
    );
  }
}
