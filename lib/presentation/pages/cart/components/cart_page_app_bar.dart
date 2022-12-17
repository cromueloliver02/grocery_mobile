import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../widgets/gcr_button.dart';
import '../../../utils/utils.dart';

class CartPageAppBar extends StatelessWidget {
  const CartPageAppBar({super.key});

  void _showClearCartDialog(BuildContext ctx) async {
    final bool? response = await FunctionHandler.showWarningDialog(
      ctx,
      title: 'Clear Cart',
      message: 'Do you wanna clear your cart?',
    );

    debugPrint(response.toString());
    // clear cart functionality
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          title: Text(
            'Cart (13)',
            style: textTheme.headline3,
          ),
          trailing: IconButton(
            onPressed: () => _showClearCartDialog(context),
            iconSize: 30,
            icon: const Icon(IconlyBroken.delete),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GCRButton.elevated(
                labelText: 'Order Now',
                onPressed: () {},
              ),
              Text(
                'Total: \$10.38',
                style: textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
