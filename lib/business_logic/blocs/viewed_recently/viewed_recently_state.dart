part of 'viewed_recently_bloc.dart';

class ViewedRecentlyState extends Equatable {
  final List<Product> viewedItems;
  final ViewedRecentlyStatus status;

  final GCRError error;

  const ViewedRecentlyState({
    required this.viewedItems,
    required this.status,
    required this.error,
  });

  factory ViewedRecentlyState.initial() {
    return const ViewedRecentlyState(
      viewedItems: <Product>[],
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
    List<Product>? viewedItems,
    ViewedRecentlyStatus? status,
    GCRError? error,
  }) {
    return ViewedRecentlyState(
      viewedItems: viewedItems ?? this.viewedItems,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
