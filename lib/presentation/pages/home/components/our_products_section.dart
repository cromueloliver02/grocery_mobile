import 'package:flutter/material.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class OurProductsSection extends StatelessWidget {
  const OurProductsSection({super.key});

  void _goToFeedPage(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductListBloc>.value(
              value: ctx.read<ProductListBloc>(),
            ),
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
          ],
          child: const FeedPage(),
        ),
      ),
    );
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
              childAspectRatio: 400 / 450,
              children: List.generate(
                state.productList.length < 6 ? state.productList.length : 6,
                (idx) => BlocProvider<AddCartItemCubit>(
                  create: (ctx) => AddCartItemCubit(
                    cartRepository: ctx.read<CartRepository>(),
                  ),
                  child: GCRProductCard.feed(
                    product: state.productList[idx],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
