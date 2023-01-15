part of 'update_ship_address_cubit.dart';

class UpdateShipAddressState extends Equatable {
  final UpdateShipAddressStatus status;
  final GCRError error;

  const UpdateShipAddressState({
    required this.status,
    required this.error,
  });

  factory UpdateShipAddressState.initial() {
    return const UpdateShipAddressState(
      status: UpdateShipAddressStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'UpdateShipAddressState(status: $status, error: $error)';

  UpdateShipAddressState copyWith({
    UpdateShipAddressStatus Function()? status,
    GCRError Function()? error,
  }) {
    return UpdateShipAddressState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
