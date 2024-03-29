part of 'gcr_product_card.dart';

class _ProductSaleCard extends StatelessWidget {
  const _ProductSaleCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailsPage.id,
        arguments: product,
      ),
      child: Material(
        color: theme.cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FancyShimmerImage(
                    imageUrl: product.imageUrl,
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        '1 ${product.measureUnit == MeasureUnit.kg ? "Kg." : "Pcs."}',
                        style: textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          BlocBuilder<CartBloc, CartState>(
                            builder: (ctx, state) => GestureDetector(
                              onTap: state.cart.inCart(product.id)
                                  ? null
                                  : () => addToCart(context, product),
                              child: Icon(
                                state.cart.inCart(product.id)
                                    ? IconlyBold.bag2
                                    : IconlyLight.bag2,
                                size: 22,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (ctx, state) => GestureDetector(
                              onTap: () => toggleWishlist(context, product),
                              child: Icon(
                                state.wishlist.inWishlist(product.id)
                                    ? IconlyBold.heart
                                    : IconlyLight.heart,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!product.isOnSale)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.headlineMedium!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      if (product.isOnSale) ...[
                        Text(
                          '\$${product.salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headlineMedium!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.titleLarge!.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: textTheme.headlineMedium!.fontSize! - 2,
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
