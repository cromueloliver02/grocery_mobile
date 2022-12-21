import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
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
          children: List.generate(
            Product.products.length < 6 ? Product.products.length : 6,
            (idx) => GCRProductCard.feed(
              name: Product.products[idx].name,
              imageUrl: Product.products[idx].imageUrl,
              price: Product.products[idx].price,
              salePrice: Product.products[idx].salePrice,
            ),
          ),
        ),
      ],
    );
  }
}
