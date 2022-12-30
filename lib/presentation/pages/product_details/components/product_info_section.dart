import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/blocs/blocs.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.product,
  });

  final Product product;

  void _addOrRemoveWishlist(BuildContext ctx, Product product) {
    ctx.read<WishlistBloc>().add(WishlistAddedOrRemoved(product: product));
  }

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
              style: textTheme.headline2,
            ),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (ctx, state) => IconButton(
                onPressed: () => _addOrRemoveWishlist(context, product),
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
            if (product.salePrice == null)
              RichText(
                text: TextSpan(
                  text: '\$${product.price} ',
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
            if (product.salePrice != null) ...[
              RichText(
                text: TextSpan(
                  text: '\$${product.salePrice} ',
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
                '\$${product.price}',
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
