import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../data/models/models.dart';
import '../../business_logic/blocs/blocs.dart';
import '../../business_logic/cubits/cubits.dart';
import './widgets.dart';
import '../pages/pages.dart';
import '../../utils/utils.dart';

class GCRCartCard extends StatefulWidget {
  const GCRCartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  State<GCRCartCard> createState() => _GCRCartCardState();
}

class _GCRCartCardState extends State<GCRCartCard> {
  late final TextEditingController _qtyController;

  void _removeCartItem(BuildContext ctx) async {
    final CartActionCubit removeCartItemCubit = ctx.read<CartActionCubit>();
    final String userId = ctx.read<UserBloc>().state.user.id;

    final bool? response = await showWarningDialog(
      ctx,
      title: 'Delete Cart Item',
      message: 'Are you sure you want to delete this item?',
    );

    if (response != null && response) {
      removeCartItemCubit.removeFromCart(
        userId: userId,
        cartItemId: widget.cartItem.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;
    final double currentPrice =
        widget.cartItem.product.salePrice ?? widget.cartItem.product.price;

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          ProductDetailsPage.id,
          arguments: widget.cartItem.product,
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: widget.cartItem.product.imageUrl,
                width: screenSize.width * 0.3,
                height: screenSize.width * 0.3,
                boxFit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.product.name,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GCRQuantityController(
                    qtyController: _qtyController,
                    cartItemId: widget.cartItem.id,
                    quantity: widget.cartItem.quantity,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _removeCartItem(context),
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
                    '\$${(widget.cartItem.quantity * currentPrice).toStringAsFixed(2)}',
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
    _qtyController =
        TextEditingController(text: widget.cartItem.quantity.toString());
  }

  @override
  void didUpdateWidget(covariant GCRCartCard oldWidget) {
    if (widget.cartItem.quantity != oldWidget.cartItem.quantity) {
      _qtyController.text = widget.cartItem.quantity.toString();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }
}
