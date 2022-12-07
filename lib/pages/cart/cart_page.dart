import 'package:flutter/material.dart';

import '../pages.dart';

class CartPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('CART PAGE'),
    );
  }
}
