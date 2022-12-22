part of './gcr_product_card.dart';

class _ProductSaleCard extends StatelessWidget {
  const _ProductSaleCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.salePrice,
    required this.measureUnit,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final double price;
  final double? salePrice;
  final MeasureUnit measureUnit;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Material(
      color: theme.cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _goToProductDetailsPage(context),
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
                    imageUrl: imageUrl,
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        '1 ${measureUnit == MeasureUnit.kg ? "Kg." : "Pcs."}',
                        style: textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              IconlyLight.bag,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              IconlyLight.heart,
                              size: 22,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (salePrice == null)
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline2!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      if (salePrice != null) ...[
                        Text(
                          '\$${salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headline2!.copyWith(
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline4!.copyWith(
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
                  name,
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

class _ProductFeedCard extends StatefulWidget {
  const _ProductFeedCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.salePrice,
    required this.measureUnit,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final double price;
  final double? salePrice;
  final MeasureUnit measureUnit;

  @override
  State<_ProductFeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<_ProductFeedCard> {
  late final TextEditingController _quantityController;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
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
                    imageUrl: widget.imageUrl,
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconlyLight.heart,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        children: [
                          if (widget.salePrice == null)
                            Text(
                              '\$${widget.price.toStringAsFixed(2)}',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          if (widget.salePrice != null) ...[
                            Text(
                              '\$${widget.salePrice!.toStringAsFixed(2)}',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '\$${widget.price.toStringAsFixed(2)}',
                              style: textTheme.headline4!.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const Spacer(),
                      Text(
                        widget.measureUnit == MeasureUnit.kg ? 'Kg.' : 'Pcs.',
                        style: textTheme.headline5,
                      ),
                      Container(
                        width: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                          ],
                        ),
                      ),
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
              child: InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: textTheme.bodyText1,
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

class _ProductCartCard extends StatelessWidget {
  const _ProductCartCard({
    Key? key,
    required this.price,
    this.salePrice,
  }) : super(key: key);

  final double price;
  final double? salePrice;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
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
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                width: screenSize.width * 0.3,
                height: screenSize.width * 0.3,
                boxFit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'Product Name',
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const GCRQuantityController(),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.cart_badge_minus,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.red,
                    iconSize: 30,
                    icon: const Icon(IconlyBold.heart),
                  ),
                  if (salePrice == null)
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: textTheme.bodyText1!.fontSize! + 4,
                      ),
                    ),
                  if (salePrice != null)
                    Text(
                      '\$${salePrice!.toStringAsFixed(2)}',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: textTheme.bodyText1!.fontSize! + 4,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductWishlistCard extends StatelessWidget {
  const _ProductWishlistCard({
    Key? key,
    required this.price,
    this.salePrice,
  }) : super(key: key);

  final double price;
  final double? salePrice;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
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
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  width: screenSize.width * 0.2,
                  height: screenSize.width * 0.2,
                  boxFit: BoxFit.cover,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              IconlyBold.bag2,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              IconlyBold.heart,
                              color: Colors.red,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Tomatoes',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (salePrice == null)
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (salePrice != null) ...[
                        Text(
                          '\$${salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline4!.copyWith(
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

class _ProductOrderCard extends StatelessWidget {
  const _ProductOrderCard({
    Key? key,
    required this.price,
    required this.quantity,
    required this.date,
  }) : super(key: key);

  final double price;
  final int quantity;
  final DateTime date;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => _goToProductDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
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
                    'Product Name x$quantity',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Paid: \$${price.toStringAsFixed(2)}',
                    style: textTheme.headline5!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              DateFormat('MM/d/yyyy').format(date),
              style: textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductViewedCard extends StatelessWidget {
  const _ProductViewedCard({
    Key? key,
    required this.price,
    this.salePrice,
  }) : super(key: key);

  final double price;
  final double? salePrice;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => _goToProductDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
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
                    'Product Name',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      if (salePrice == null)
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      if (salePrice != null) ...[
                        Text(
                          '\$${salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: textTheme.headline5!.copyWith(
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
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: theme.canvasColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
