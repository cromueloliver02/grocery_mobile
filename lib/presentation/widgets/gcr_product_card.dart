// ignore_for_file: unused_element

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class GCRProductCard extends StatelessWidget {
  const GCRProductCard.sale({
    super.key,
    required this.price,
    this.salePrice,
    this.isSale = true,
    this.isFeed = false,
  });

  const GCRProductCard.feed({
    super.key,
    required this.price,
    this.salePrice,
    this.isSale = false,
    this.isFeed = true,
  });

  final double price;
  final double? salePrice;
  final bool isSale;
  final bool isFeed;

  @override
  Widget build(BuildContext context) {
    if (isSale) {
      return _ProductSaleCard(
        price: price,
        salePrice: salePrice,
      );
    }

    if (isFeed) {
      return _ProductFeedCard(
        price: price,
        salePrice: salePrice,
      );
    }

    return const SizedBox.shrink();
  }
}

class _ProductSaleCard extends StatelessWidget {
  const _ProductSaleCard({
    Key? key,
    required this.price,
    this.salePrice,
  }) : super(key: key);

  final double price;
  final double? salePrice;

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
        onTap: () {},
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
                    imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        '1KG',
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
                  'Product Name',
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
    required this.price,
    this.salePrice,
  }) : super(key: key);

  final double price;
  final double? salePrice;

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
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    boxFit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Product Name',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headline4!.copyWith(
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
                        'KG',
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
