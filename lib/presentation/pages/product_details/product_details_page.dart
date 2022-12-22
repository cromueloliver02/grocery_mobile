import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../pages.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/product-details';

  static Route<void> route(RouteSettings settings) {
    final Product product = settings.arguments as Product;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => ProductDetailsPage(product: product),
    );
  }

  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) => ProductDetailsView(product: product);
}
