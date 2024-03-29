part of 'gcr_product_card.dart';

class _ProductViewedCard extends StatelessWidget {
  const _ProductViewedCard({
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
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailsPage.id,
        arguments: product,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FancyShimmerImage(
              imageUrl: product.imageUrl,
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
                    product.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      if (!product.isOnSale)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      if (product.isOnSale) ...[
                        Text(
                          '\$${product.salePrice!.toStringAsFixed(2)}',
                          style: textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
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
                ],
              ),
            ),
            const SizedBox(width: 10),
            BlocBuilder<CartBloc, CartState>(
              builder: (ctx, state) => GestureDetector(
                onTap: state.cart.inCart(product.id)
                    ? null
                    : () => addToCart(context, product),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    state.cart.inCart(product.id) ? Icons.check : Icons.add,
                    size: 30,
                    color: theme.canvasColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
