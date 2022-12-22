import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  void _goToOnSalePage(BuildContext ctx) {
    Navigator.pushNamed(ctx, OnSalePage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (ctx, productListState) {
        if (productListState.status == ProductListStatus.initial) {
          return const SizedBox.shrink();
        }

        if (productListState.status == ProductListStatus.loading) {
          return const GCRLoadingCard();
        }

        if (productListState.status == ProductListStatus.failure) {
          return const GCRErrorCard();
        }

        if (ctx.watch<ProductsOnSaleBloc>().state.productsOnSale.isEmpty) {
          return const GCRMessageCard(message: 'Product on sale is empty');
        }

        return Column(
          children: [
            GCRButton.text(
              labelText: 'View All',
              onPressed: () => _goToOnSalePage(context),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ON SALE',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          IconlyLight.discount,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: _ProductOnSaleList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProductOnSaleList extends StatelessWidget {
  const _ProductOnSaleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsOnSaleBloc, ProductsOnSaleState>(
      builder: (ctx, productOnSaleState) {
        final int productSaleCount = productOnSaleState.productsOnSale.length;

        return ListView.separated(
          itemCount: productSaleCount < 5 ? productSaleCount : 5,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: 10),
          separatorBuilder: (ctx, idx) => const SizedBox(width: 10),
          itemBuilder: (ctx, idx) => GCRProductCard.sale(
            name: productOnSaleState.productsOnSale[idx].name,
            imageUrl: productOnSaleState.productsOnSale[idx].imageUrl,
            price: productOnSaleState.productsOnSale[idx].price,
            salePrice: productOnSaleState.productsOnSale[idx].salePrice,
            measureUnit: productOnSaleState.productsOnSale[idx].measureUnit,
          ),
        );
      },
    );
  }
}
