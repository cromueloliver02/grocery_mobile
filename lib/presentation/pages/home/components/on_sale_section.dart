import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 10),
                  separatorBuilder: (ctx, idx) => const SizedBox(width: 10),
                  itemBuilder: (ctx, idx) => GCRProductCard.sale(
                    price: 2.24 + idx,
                    salePrice: idx.isEven ? 1.84 + idx : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
