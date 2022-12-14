import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class OnSaleView extends StatelessWidget {
  const OnSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products On Sale',
          style: textTheme.headline3,
        ),
      ),
      body: GridView.builder(
        itemCount: 15,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 370 / 450,
        ),
        itemBuilder: (ctx, idx) => const GCRProductCard.sale(
          price: 7.92,
          salePrice: 5.95,
        ),
      ),
    );
  }
}
