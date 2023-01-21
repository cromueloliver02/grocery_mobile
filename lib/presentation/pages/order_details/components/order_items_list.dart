import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class OrderedItemsList extends StatelessWidget {
  const OrderedItemsList({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      separatorBuilder: (ctx, idx) => const Divider(thickness: 1),
      itemBuilder: (ctx, idx) => GCROrderDetailsCard(
        name: cartItems[idx].product.name,
        imageUrl: cartItems[idx].product.imageUrl,
        quantity: cartItems[idx].quantity,
        price: cartItems[idx].product.price,
        salePrice: cartItems[idx].product.salePrice,
        isOnSale: cartItems[idx].product.isOnSale,
      ),
    );
  }
}
