part of 'gcr_product_card.dart';

class _ProductWishlistCard extends StatelessWidget {
  const _ProductWishlistCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          ProductDetailsPage.id,
          arguments: product,
        ),
        borderRadius: BorderRadius.circular(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                FancyShimmerImage(
                  imageUrl: product.imageUrl,
                  width: screenSize.width * 0.18,
                  height: screenSize.width * 0.18,
                  boxFit: BoxFit.cover,
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                color: state.cart.inCart(product.id)
                                    ? Colors.green
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () => toggleWishlist(context, product),
                            child: const Icon(
                              IconlyBold.heart,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (!product.isOnSale)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (product.isOnSale) ...[
                        Text(
                          '\$${product.salePrice!.toStringAsFixed(2)}',
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.headlineSmall!.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
