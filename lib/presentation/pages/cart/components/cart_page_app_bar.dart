import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../widgets/gcr_button.dart';

class CartPageAppBar extends StatelessWidget {
  const CartPageAppBar({super.key});

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
            onPressed: () {},
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
