part of 'viewed_recently_bloc.dart';

class ViewedRecentlyState extends Equatable {
  final Map<String, Product> viewedItems;

  const ViewedRecentlyState({
    required this.viewedItems,
  });

  factory ViewedRecentlyState.initial() {
    return const ViewedRecentlyState(
      viewedItems: <String, Product>{},
    );
  }

  @override
  List<Object> get props => [viewedItems];

  @override
  String toString() {
    return 'ViewedRecentlyState(viewedItems: $viewedItems)';
  }

  ViewedRecentlyState copyWith({
    Map<String, Product> Function()? viewedItems,
  }) {
    return ViewedRecentlyState(
      viewedItems: viewedItems != null ? viewedItems() : this.viewedItems,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    final List<MapEntry<String, Product>> viewedItemList =
        viewedItems.entries.toList();

    final Map<String, dynamic> viewedItemsToJson = {};

    for (final MapEntry<String, Product> viewedItem in viewedItemList) {
      viewedItemsToJson.putIfAbsent(
        viewedItem.key,
        () => viewedItem.value.toMap(),
      );
    }

    result.addAll({'viewedItems': viewedItemsToJson});

    return result;
  }

  factory ViewedRecentlyState.fromMap(Map<String, dynamic> map) {
    final viewedItemsMap = Map<String, dynamic>.from(map['viewedItems']);

    final List<MapEntry<String, dynamic>> viewedItemList =
        viewedItemsMap.entries.toList();

    final Map<String, Product> viewedItemsFromJson = {};

    for (final MapEntry<String, dynamic> viewedItem in viewedItemList) {
      viewedItemsFromJson.putIfAbsent(
        viewedItem.key,
        () => Product.fromMap(viewedItem.value),
      );
    }

    return ViewedRecentlyState(
      viewedItems: viewedItemsFromJson,
    );
  }
}
