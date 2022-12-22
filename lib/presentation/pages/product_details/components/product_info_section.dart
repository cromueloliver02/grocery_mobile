import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.name,
    required this.price,
    required this.salePrice,
  });

  final String name;
  final double price;
  final double? salePrice;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: textTheme.headline2,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              color: Colors.red,
              icon: const Icon(IconlyLight.heart),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            if (salePrice == null)
              RichText(
                text: TextSpan(
                  text: '\$$price ',
                  style: textTheme.headline2!.copyWith(
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '/Kg',
                      style: textTheme.bodyText2,
                    )
                  ],
                ),
              ),
            if (salePrice != null) ...[
              RichText(
                text: TextSpan(
                  text: '\$$salePrice ',
                  style: textTheme.headline2!.copyWith(
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '/Kg',
                      style: textTheme.bodyText2,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '\$$price',
                style: textTheme.bodyText1!.copyWith(
                  fontSize: textTheme.bodyText1!.fontSize! + 2,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
            const Spacer(),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(5),
              child: Text(
                'Free Delivery',
                style: textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
