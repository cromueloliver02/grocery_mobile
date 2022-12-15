import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ProductDetailsPageBottomBar extends StatelessWidget {
  const ProductDetailsPageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      color: theme.cardColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: '\$2.59/',
                    style: textTheme.headline3,
                    children: [
                      TextSpan(
                        text: '1Kg',
                        style: textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GCRButton.elevated(
              labelText: 'Add To Cart',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
