import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/blocs/blocs.dart';
import '../../../../utils/utils.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name,
              style: textTheme.displayMedium,
            ),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (ctx, state) => IconButton(
                onPressed: () => toggleWishlist(context, product),
                iconSize: 30,
                color: Colors.red,
                icon: state.wishlist.inWishlist(product.id)
                    ? const Icon(IconlyBold.heart)
                    : const Icon(IconlyLight.heart),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            if (!product.isOnSale)
              RichText(
                text: TextSpan(
                  text: '\$${product.price} ',
                  style: textTheme.displayMedium!.copyWith(
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '/Kg',
                      style: textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            if (product.isOnSale) ...[
              RichText(
                text: TextSpan(
                  text: '\$${product.salePrice} ',
                  style: textTheme.displayMedium!.copyWith(
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '/Kg',
                      style: textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '\$${product.price}',
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: textTheme.bodyLarge!.fontSize! + 2,
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
                style: textTheme.bodyLarge!.copyWith(
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
