import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  final ProductRepository productRepository;

  SearchProductCubit({
    required this.productRepository,
  }) : super(SearchProductState.initial());

  void searchProducts(String keywords) async {
    emit(state.copyWith(status: SearchProductStatus.loading));

    try {
      final List<Product> searchResults =
          await productRepository.searchProducts(keywords);

      emit(state.copyWith(
        searchResults: searchResults,
        status: SearchProductStatus.success,
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: SearchProductStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }

  void setKeywords(String keywords) {
    emit(state.copyWith(keywords: () => keywords));
  }

  void clearSearchResults() {
    emit(state.copyWith(
      searchResults: [],
      status: SearchProductStatus.initial,
    ));
  }

  void clearKeywords() {
    emit(state.copyWith(keywords: () => null));
  }
}
