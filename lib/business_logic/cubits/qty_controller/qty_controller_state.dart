part of 'qty_controller_cubit.dart';

class QtyControllerState extends Equatable {
  final int quantity;

  const QtyControllerState({
    required this.quantity,
  });

  factory QtyControllerState.initial() {
    return const QtyControllerState(quantity: 1);
  }

  @override
  List<Object> get props => [quantity];

  @override
  String toString() => 'QtyControllerState(quantity: $quantity)';

  QtyControllerState copyWith({
    int Function()? quantity,
  }) {
    return QtyControllerState(
      quantity: quantity != null ? quantity() : this.quantity,
    );
  }
}
