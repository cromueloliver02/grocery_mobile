import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import './feed_page_search_bar.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'All Products',
          style: textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const FeedPageSearchBar(),
            Expanded(
              child: BlocBuilder<ProductListBloc, ProductListState>(
                builder: (ctx, state) => GridView.builder(
                  itemCount: state.productList.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 370 / 450,
                  ),
                  itemBuilder: (ctx, idx) => GCRProductCard.feed(
                    product: state.productList[idx],
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
