part of 'clear_cart_cubit.dart';

class ClearCartState extends Equatable {
  final ClearCartStatus status;
  final GCRError error;

  const ClearCartState({
    required this.status,
    required this.error,
  });

  factory ClearCartState.initial() {
    return const ClearCartState(
      status: ClearCartStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'ClearCartState(status: $status, error: $error)';

  ClearCartState copyWith({
    ClearCartStatus Function()? status,
    GCRError Function()? error,
  }) {
    return ClearCartState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
