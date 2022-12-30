import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import '../../../../data/models/models.dart';
// import '../../../../presentation/widgets/widgets.dart';
import './product_details_page_bottom_bar.dart';
import './product_info_section.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late final TextEditingController _qtyController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: ProductDetailsPageBottomBar(
        qtyController: _qtyController,
        currentPrice: widget.product.salePrice ?? widget.product.price,
        product: widget.product,
      ),
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: widget.product.imageUrl,
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
                ProductInfoSection(product: widget.product),
                const SizedBox(height: 30),
                // temporarily hidden
                // GCRQuantityController(qtyController: _qtyController),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }
}
