import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class OurProductsSection extends StatelessWidget {
  const OurProductsSection({super.key});

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
                    style: textTheme.displaySmall,
                  ),
                  GCRButton.text(
                    labelText: 'Browse All',
                    onPressed: () => Navigator.pushNamed(
                      ctx,
                      ProductFeedsPage.id,
                    ),
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
              childAspectRatio: 400 / 350,
              children: List.generate(
                state.productList.length < 6 ? state.productList.length : 6,
                (idx) => GCRProductCard.feed(
                  product: state.productList[idx],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
