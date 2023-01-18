part of 'viewed_recently_bloc.dart';

class ViewedRecentlyState extends Equatable {
  final Map<String, Product> viewedItems;
  final ViewedRecentlyStatus status;
  final GCRError error;

  const ViewedRecentlyState({
    required this.viewedItems,
    required this.status,
    required this.error,
  });

  factory ViewedRecentlyState.initial() {
    return const ViewedRecentlyState(
      viewedItems: <String, Product>{},
      status: ViewedRecentlyStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [viewedItems, status, error];

  @override
  String toString() {
    return 'ViewedRecentlyState(viewedItems: $viewedItems, status: $status, error: $error)';
  }

  ViewedRecentlyState copyWith({
    Map<String, Product> Function()? viewedItems,
    ViewedRecentlyStatus Function()? status,
    GCRError Function()? error,
  }) {
    return ViewedRecentlyState(
      viewedItems: viewedItems != null ? viewedItems() : this.viewedItems,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
