import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';

class ProductDetailsPageBottomBar extends StatefulWidget {
  const ProductDetailsPageBottomBar({
    super.key,
    required this.qtyController,
    required this.currentPrice,
  });

  final TextEditingController qtyController;
  final double currentPrice;

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
                  style: textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 5),
                BlocBuilder<QtyControllerCubit, QtyControllerState>(
                  builder: (ctx, state) => Text(
                    '\$${(widget.currentPrice * state.quantity).toStringAsFixed(2)}',
                    style: textTheme.headline3,
                  ),
                ),
              ],
            ),
            GCRButton.elevated(
              labelText: 'Add To Cart',
              onPressed: () {},
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
