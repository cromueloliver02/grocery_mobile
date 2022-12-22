import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class OurProductsSection extends StatelessWidget {
  const OurProductsSection({super.key});

  void _goToFeedPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, FeedPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (ctx, state) {
        if (state.productList.isEmpty) {
          return const GCRMessageCard(message: 'Product feeds is empty');
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Products',
                    style: textTheme.headline3,
                  ),
                  GCRButton.text(
                    labelText: 'Browse All',
                    onPressed: () => _goToFeedPage(context),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 370 / 450,
              children: List.generate(
                state.productList.length < 6 ? state.productList.length : 6,
                (idx) => GCRProductCard.feed(
                  name: state.productList[idx].name,
                  imageUrl: state.productList[idx].imageUrl,
                  price: state.productList[idx].price,
                  salePrice: state.productList[idx].salePrice,
                  measureUnit: state.productList[idx].measureUnit,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
