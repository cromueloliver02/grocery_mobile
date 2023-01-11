import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class FeedsGrid extends StatelessWidget {
  const FeedsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (ctx, prodListState) =>
          BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (ctx, searchProdState) {
          if (searchProdState.keywords != null &&
              searchProdState.status == SearchProductStatus.initial) {
            return const GCRMessageCard(
              message: 'Search products',
              imageUrl: 'assets/images/basket.png',
            );
          }

          if (searchProdState.status == SearchProductStatus.loading) {
            return const GCRLoadingCard(loadingText: 'Searching...');
          }

          if (searchProdState.status == SearchProductStatus.failure) {
            return const GCRErrorCard();
          }

          if (searchProdState.status == SearchProductStatus.success &&
              searchProdState.keywords != null &&
              searchProdState.searchResults.isEmpty) {
            return const GCRMessageCard(message: 'No results found');
          }

          return GridView.builder(
            itemCount: searchProdState.keywords != null
                ? searchProdState.searchResults.length
                : prodListState.productList.length,
            padding: const EdgeInsets.symmetric(vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 400 / 350,
            ),
            itemBuilder: (ctx, idx) => GCRProductCard.feed(
              product: searchProdState.keywords != null
                  ? searchProdState.searchResults[idx]
                  : prodListState.productList[idx],
            ),
          );
        },
      ),
    );
  }
}
