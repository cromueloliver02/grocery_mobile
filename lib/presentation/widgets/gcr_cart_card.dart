import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../data/models/models.dart';
import './widgets.dart';
import '../pages/pages.dart';

class GCRCartCard extends StatefulWidget {
  const GCRCartCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  State<GCRCartCard> createState() => _GCRCartCardState();
}

class _GCRCartCardState extends State<GCRCartCard> {
  late final TextEditingController _qtyController;

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
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: widget.product.imageUrl,
                width: screenSize.width * 0.3,
                height: screenSize.width * 0.3,
                boxFit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GCRQuantityController(qtyController: _qtyController),
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
                  Text(
                    '\$${(widget.quantity * widget.product.price).toStringAsFixed(2)}',
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

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: widget.quantity.toString());
  }

  @override
  void didUpdateWidget(covariant GCRCartCard oldWidget) {
    if (widget.quantity != oldWidget.quantity) {
      _qtyController.text = widget.quantity.toString();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }
}
