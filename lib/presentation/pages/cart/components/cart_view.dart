import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10),
              title: Text(
                'Cart (13)',
                style: textTheme.headline3,
              ),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(IconlyBroken.delete),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GCRButton.elevated(
                    labelText: 'Order Now',
                    onPressed: () {},
                  ),
                  Text(
                    'Total: \$10.38',
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: const EdgeInsets.symmetric(vertical: 20),
                separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
                itemBuilder: (ctx, idx) => const GCRProductCard.cart(
                  price: 3.29,
                  salePrice: 2.87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
