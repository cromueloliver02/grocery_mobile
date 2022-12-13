import 'package:flutter/material.dart';

import './components/cart_view.dart';
import '../pages.dart';

class CartPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/cart';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const CartPage(),
    );
  }

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) => const CartView();
}
