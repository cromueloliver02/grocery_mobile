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
          arguments: widget.product,
        ),
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
                          style: textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (ctx, state) => GestureDetector(
                          onTap: () => toggleWishlist(context, widget.product),
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
                          if (!widget.product.isOnSale)
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: textTheme.headlineMedium!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          if (widget.product.isOnSale) ...[
                            Text(
                              '\$${widget.product.salePrice!.toStringAsFixed(2)}',
                              style: textTheme.headlineMedium!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: textTheme.titleLarge!.copyWith(
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
            // const Spacer(),
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
