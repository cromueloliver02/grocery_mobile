part of 'gcr_product_card.dart';

class _ProductSaleCard extends StatelessWidget {
  const _ProductSaleCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  void _addToCart(BuildContext ctx, Product product) {
    ctx.read<CartBloc>().add(CartItemAdded(product: product));
  }

  void _addOrRemoveWishlist(BuildContext ctx, Product product) {
    ctx.read<WishlistBloc>().add(WishlistAddedOrRemoved(product: product));
  }

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _goToProductDetailsPage(context),
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
                        style: textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          BlocBuilder<CartBloc, CartState>(
                            builder: (ctx, state) => GestureDetector(
                              onTap: state.cart.inCart(product.id)
                                  ? null
                                  : () => _addToCart(context, product),
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
                              onTap: () =>
                                  _addOrRemoveWishlist(context, product),
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
                      if (product.salePrice == null)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.headline4!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      if (product.salePrice != null) ...[
                        Text(
                          '\$${product.salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headline4!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.headline6!.copyWith(
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
                  style: textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: textTheme.headline4!.fontSize! - 2,
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
