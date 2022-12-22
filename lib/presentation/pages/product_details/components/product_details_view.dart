import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import '../../../../data/models/models.dart';
import '../../../../presentation/widgets/widgets.dart';
import './product_details_page_bottom_bar.dart';
import './product_info_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: const ProductDetailsPageBottomBar(),
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: product.imageUrl,
            width: screenSize.width,
            height: screenSize.height * 0.4,
            boxFit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                ProductInfoSection(
                  name: product.name,
                  price: product.price,
                  salePrice: product.salePrice,
                ),
                const SizedBox(height: 30),
                const GCRQuantityController(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
