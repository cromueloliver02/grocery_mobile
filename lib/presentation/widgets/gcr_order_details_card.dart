import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class GCROrderDetailsCard extends StatelessWidget {
  const GCROrderDetailsCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    required this.salePrice,
    required this.isOnSale,
  });

  final String name;
  final String imageUrl;
  final int quantity;
  final double price;
  final double? salePrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    FancyShimmerImage(
                      imageUrl: imageUrl,
                      width: screenSize.width * 0.3,
                      height: screenSize.width * 0.3,
                      boxFit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'x$quantity',
                        style: textTheme.bodyText1!.copyWith(
                          color: Colors.grey[600],
                          fontSize: textTheme.bodyText1!.fontSize!,
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (!isOnSale)
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.bodyText1!.copyWith(
                            fontSize: textTheme.bodyText1!.fontSize! + 2,
                          ),
                        ),
                      if (isOnSale) ...[
                        Text(
                          '\$${salePrice!.toStringAsFixed(2)}',
                          style: textTheme.bodyText1!.copyWith(
                            fontSize: textTheme.bodyText1!.fontSize! + 2,
                          ),
                        ),
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.bodyText1!.copyWith(
                            color: Colors.grey[600],
                            fontSize: textTheme.bodyText1!.fontSize! - 2,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
