import 'package:flutter/material.dart';

import './components/order_details_view.dart';

class OrderDetailsPage extends StatelessWidget {
  static const id = '/order-details';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const OrderDetailsPage(),
    );
  }

  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => const OrderDetailsView();
}
