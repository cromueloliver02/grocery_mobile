import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class ProductDetailsPageBottomBar extends StatefulWidget {
  const ProductDetailsPageBottomBar({
    super.key,
    required this.qtyController,
    required this.currentPrice,
    required this.product,
  });

  final TextEditingController qtyController;
  final double currentPrice;
  final Product product;

  @override
  State<ProductDetailsPageBottomBar> createState() =>
      _ProductDetailsPageBottomBarState();
}

class _ProductDetailsPageBottomBarState
    extends State<ProductDetailsPageBottomBar> {
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

    return Container(
      color: theme.cardColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 5),
                BlocBuilder<QtyControllerCubit, QtyControllerState>(
                  builder: (ctx, state) {
                    final double totalPrice =
                        widget.currentPrice * state.quantity;

                    return RichText(
                      text: TextSpan(
                        text: '\$${(totalPrice).toStringAsFixed(2)} / ',
                        style: textTheme.headline3,
                        children: [
                          TextSpan(
                            text: '${state.quantity}Kg',
                            style: textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<AddCartItemCubit, AddCartItemState>(
              builder: (ctx, state) => GCRButton.elevated(
                labelText: 'Add To Cart',
                loading: state.status == AddCartItemStatus.loading,
                onPressed: () => _addToCart(context, widget.product),
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

    final TextEditingController qtyController = widget.qtyController;

    qtyController.addListener(() {
      final int quantity = int.parse(qtyController.text);

      context.read<QtyControllerCubit>().changeQty(quantity);
    });
  }
}
