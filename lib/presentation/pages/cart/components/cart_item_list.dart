import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            itemCount: cartItems.length,
            padding: const EdgeInsets.symmetric(vertical: 20),
            separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
            itemBuilder: (ctx, idx) => GCRCartCard(
              key: ValueKey(cartItems[idx].id),
              product: cartItems[idx].product,
              quantity: cartItems[idx].quantity,
            ),
          ),
        ),
      ],
    );
  }
}
