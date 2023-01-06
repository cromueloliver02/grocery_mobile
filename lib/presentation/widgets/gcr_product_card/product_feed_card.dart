part of 'gcr_product_card.dart';

class _ProductFeedCard extends StatefulWidget {
  const _ProductFeedCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<_ProductFeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<_ProductFeedCard> {
  late final TextEditingController _quantityController;

  void _addToCart(BuildContext ctx, Product product) {
    final String userId = ctx.read<UserBloc>().state.user.id;

    ctx.read<CartBloc>().add(CartItemAdded(
          userId: userId,
          product: product,
        ));
  }

  void _addOrRemoveWishlist(BuildContext ctx, Product product) {
    ctx.read<WishlistBloc>().add(WishlistAddedOrRemoved(product: product));
  }

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id, arguments: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => _goToProductDetailsPage(context),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: widget.product.imageUrl,
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.product.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (ctx, state) => GestureDetector(
                          onTap: () =>
                              _addOrRemoveWishlist(context, widget.product),
                          child: Icon(
                            state.wishlist.inWishlist(widget.product.id)
                                ? IconlyBold.heart
                                : IconlyLight.heart,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.product.salePrice == null)
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: textTheme.headline4!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          if (widget.product.salePrice != null) ...[
                            Text(
                              '\$${widget.product.salePrice!.toStringAsFixed(2)}',
                              style: textTheme.headline4!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: textTheme.headline6!.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Material(
              color: theme.cardColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (ctx, state) => InkWell(
                  onTap: state.cart.inCart(widget.product.id)
                      ? null
                      : () => _addToCart(context, widget.product),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        state.cart.inCart(widget.product.id)
                            ? 'In Cart'
                            : 'Add to Cart',
                        style: textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }
}
