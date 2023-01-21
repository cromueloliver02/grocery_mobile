import 'package:flutter/material.dart';

import './components/orders_view.dart';

class OrdersPage extends StatelessWidget {
  static const String id = '/orders';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const OrdersPage(),
    );
  }

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) => const OrdersView();
}
