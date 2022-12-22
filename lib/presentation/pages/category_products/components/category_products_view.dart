import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import './category_products_page_search_bar.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category,
          style: textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CategoryProductsPageSearchBar(),
            Expanded(
              child: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
                builder: (ctx, state) => GridView.builder(
                  itemCount: state.categoryProducts.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 370 / 450,
                  ),
                  itemBuilder: (ctx, idx) => GCRProductCard.feed(
                    product: state.categoryProducts[idx],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
