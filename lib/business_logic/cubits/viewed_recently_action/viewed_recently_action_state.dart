part of 'viewed_recently_action_cubit.dart';

class ViewedRecentlyActionState extends Equatable {
  final ViewedRecentlyActionStatus status;
  final GCRError error;

  const ViewedRecentlyActionState({
    required this.status,
    required this.error,
  });

  factory ViewedRecentlyActionState.initial() {
    return const ViewedRecentlyActionState(
      status: ViewedRecentlyActionStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() =>
      'ViewedRecentlyActionState(status: $status, error: $error)';

  ViewedRecentlyActionState copyWith({
    ViewedRecentlyActionStatus Function()? status,
    GCRError Function()? error,
  }) {
    return ViewedRecentlyActionState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
