import 'package:flutter/material.dart';

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
          children: const [
            GCRProductCard.feed(
              price: 3.92,
              salePrice: 2.477777,
            ),
            GCRProductCard.feed(price: 4.92),
            GCRProductCard.feed(
              price: 5.92,
              salePrice: 5.2,
            ),
            GCRProductCard.feed(price: 6.92),
            GCRProductCard.feed(
              price: 7.92,
              salePrice: 5.95,
            ),
          ],
        ),
      ],
    );
  }
}
