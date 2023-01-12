part of 'viewed_recently_bloc.dart';

class ViewedRecentlyState extends Equatable {
  final Map<String, Product> viewedItems;
  final ViewedRecentlyStatus status;
  final ViewedRecentlyFormStatus formStatus;
  final GCRError error;

  const ViewedRecentlyState({
    required this.viewedItems,
    required this.status,
    required this.formStatus,
    required this.error,
  });

  factory ViewedRecentlyState.initial() {
    return const ViewedRecentlyState(
      viewedItems: <String, Product>{},
      status: ViewedRecentlyStatus.initial,
      formStatus: ViewedRecentlyFormStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [viewedItems, status, formStatus, error];

  @override
  String toString() {
    return 'ViewedRecentlyState(viewedItems: $viewedItems, status: $status, formStatus: $formStatus, error: $error)';
  }

  ViewedRecentlyState copyWith({
    Map<String, Product> Function()? viewedItems,
    ViewedRecentlyStatus Function()? status,
    ViewedRecentlyFormStatus Function()? formStatus,
    GCRError Function()? error,
  }) {
    return ViewedRecentlyState(
      viewedItems: viewedItems != null ? viewedItems() : this.viewedItems,
      status: status != null ? status() : this.status,
      formStatus: formStatus != null ? formStatus() : this.formStatus,
      error: error != null ? error() : this.error,
    );
  }
}
