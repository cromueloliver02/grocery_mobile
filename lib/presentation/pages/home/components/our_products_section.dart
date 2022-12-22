import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';
import '../../../utils/utils.dart';

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
        BlocBuilder<ProductFeedBloc, ProductFeedState>(
          builder: (ctx, state) {
            if (state.status == ProductFeedStatus.initial) {
              return const SizedBox.shrink();
            }

            if (state.status == ProductFeedStatus.loading) {
              return const GCRLoading();
            }

            if (state.status == ProductFeedStatus.failure) {
              return const GCRErrorCard();
            }

            if (state.productFeeds.isEmpty) {
              return const GCRMessageCard(message: 'Products feeds is empty');
            }

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 370 / 450,
              children: List.generate(
                state.productFeeds.length < 6 ? state.productFeeds.length : 6,
                (idx) => GCRProductCard.feed(
                  name: state.productFeeds[idx].name,
                  imageUrl: state.productFeeds[idx].imageUrl,
                  price: state.productFeeds[idx].price,
                  salePrice: state.productFeeds[idx].salePrice,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
