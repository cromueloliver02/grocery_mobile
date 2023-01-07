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

  void _addOrRemoveWishlist(BuildContext ctx, Product product) {
    ctx.read<WishlistBloc>().add(WishlistAddedOrRemoved(product: product));
  }

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
          ],
          child: ProductDetailsPage(product: widget.product),
        ),
      ),
    );
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
            AddToCartButton(product: widget.product),
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

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final Product product;

  void _addToCart(BuildContext ctx, Product product) {
    final String userId = ctx.read<UserBloc>().state.user.id;

    ctx.read<AddCartItemCubit>().addToCart(
          userId: userId,
          product: product,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      color: theme.cardColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (ctx, cartState) =>
            BlocBuilder<AddCartItemCubit, AddCartItemState>(
          builder: (ctx, cartItemState) {
            final bool cartItemLoading =
                cartItemState.status == AddCartItemStatus.loading;

            return InkWell(
              onTap: cartState.cart.inCart(product.id) || cartItemLoading
                  ? null
                  : () => _addToCart(context, product),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Container(
                color: cartItemLoading ? Colors.grey[300] : Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cartItemLoading)
                          const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        const SizedBox(width: 10),
                        Text(
                          cartState.cart.inCart(product.id)
                              ? 'In Cart'
                              : cartItemLoading
                                  ? 'Adding to cart...'
                                  : 'Add to Cart',
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
