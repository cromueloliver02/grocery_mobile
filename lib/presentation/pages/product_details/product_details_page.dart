import 'package:flutter/material.dart';

import '../pages.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/product-details';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const ProductDetailsPage(),
    );
  }

  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => const ProductDetailsView();
}
