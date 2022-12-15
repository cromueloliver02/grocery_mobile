import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 20),
        separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
        itemBuilder: (ctx, idx) => const GCRProductCard.cart(
          price: 3.29,
          salePrice: 2.87,
        ),
      ),
    );
  }
}
