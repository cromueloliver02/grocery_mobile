import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
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
      body: BlocBuilder<ProductsOnSaleBloc, ProductsOnSaleState>(
        builder: (ctx, state) => GridView.builder(
          itemCount: state.onSaleProducts.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 400 / 400,
          ),
          itemBuilder: (ctx, idx) => GCRProductCard.sale(
            product: state.onSaleProducts[idx],
          ),
        ),
      ),
    );
  }
}
