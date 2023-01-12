part of 'search_product_cubit.dart';

class SearchProductState extends Equatable {
  final String? keywords;
  final List<Product> searchResults;
  final SearchProductStatus status;
  final GCRError error;

  const SearchProductState({
    required this.keywords,
    required this.searchResults,
    required this.status,
    required this.error,
  });

  factory SearchProductState.initial() {
    return const SearchProductState(
      keywords: null,
      searchResults: <Product>[],
      status: SearchProductStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object?> get props => [keywords, searchResults, status, error];

  @override
  String toString() {
    return 'SearchProductState(keywords: $keywords, searchResults: $searchResults, status: $status, error: $error)';
  }

  SearchProductState copyWith({
    String? Function()? keywords,
    List<Product> Function()? searchResults,
    SearchProductStatus Function()? status,
    GCRError Function()? error,
  }) {
    return SearchProductState(
      keywords: keywords != null ? keywords() : this.keywords,
      searchResults:
          searchResults != null ? searchResults() : this.searchResults,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
