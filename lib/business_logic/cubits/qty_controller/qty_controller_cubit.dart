import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'qty_controller_state.dart';

class QtyControllerCubit extends Cubit<QtyControllerState> {
  QtyControllerCubit() : super(QtyControllerState.initial());

  void changeQty(int quantity) {
    emit(state.copyWith(quantity: quantity));
  }
}
