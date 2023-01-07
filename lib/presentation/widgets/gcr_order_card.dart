import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';
import '../pages/pages.dart';

class GCROrderCard extends StatelessWidget {
  const GCROrderCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.date,
  });

  final Product product;
  final int quantity;
  final DateTime date;

  void _goToProductDetailsPage(BuildContext ctx) {
    ProductDetailsPage.pushRoute(ctx, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => _goToProductDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              width: screenSize.width * 0.25,
              height: screenSize.width * 0.25,
              boxFit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name x$quantity',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Paid: \$${product.price.toStringAsFixed(2)}',
                    style: textTheme.headline5!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              DateFormat('MM/d/yyyy').format(date),
              style: textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
