part of 'add_cart_item_cubit.dart';

class AddCartItemState extends Equatable {
  final AddCartItemStatus status;
  final GCRError error;

  const AddCartItemState({
    required this.status,
    required this.error,
  });

  factory AddCartItemState.initial() {
    return const AddCartItemState(
      status: AddCartItemStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'AddCartItemState(status: $status, error: $error)';

  AddCartItemState copyWith({
    AddCartItemStatus? status,
    GCRError? error,
  }) {
    return AddCartItemState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
