part of 'gcr_product_card.dart';

class _ProductViewedCard extends StatelessWidget {
  const _ProductViewedCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  void _goToProductDetailsPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ProductDetailsPage.id, arguments: product);
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
                      if (product.salePrice == null)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      if (product.salePrice != null) ...[
                        Text(
                          '\$${product.salePrice!.toStringAsFixed(2)}',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
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
