import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
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
                  style: textTheme.displaySmall!.copyWith(
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
                        style: textTheme.displaySmall,
                        children: [
                          TextSpan(
                            text: '${state.quantity}Kg',
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<CartActionCubit, CartActionState>(
              builder: (ctx, state) => GCRButton.elevated(
                labelText: 'Add To Cart',
                loading: state.status == CartActionStatus.loading,
                onPressed: () => addToCart(context, widget.product),
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
