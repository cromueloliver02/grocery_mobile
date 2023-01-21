import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';
import '../../presentation/pages/pages.dart';

class GCROrderCard extends StatelessWidget {
  const GCROrderCard({
    super.key,
    required this.orderItem,
  });

  final OrderItem orderItem;

  void _goToOrderDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, OrderDetailsPage.id, arguments: orderItem);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;
    final CartItem cartItem = orderItem.cartItems.first;

    return InkWell(
      onTap: () => _goToOrderDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FancyShimmerImage(
              imageUrl: cartItem.product.imageUrl,
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
                    '${cartItem.product.name} x${cartItem.quantity}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Paid: \$${orderItem.grandTotalPrice.toStringAsFixed(2)}',
                    style: textTheme.headline5!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${orderItem.cartItems.length} ${orderItem.cartItems.length == 1 ? 'item' : 'items'}',
                  style: textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat('h:mm a').format(orderItem.createdAt),
                  style: textTheme.headline5!.copyWith(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  DateFormat('MM/d/yyyy').format(orderItem.createdAt),
                  style: textTheme.headline5!.copyWith(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
