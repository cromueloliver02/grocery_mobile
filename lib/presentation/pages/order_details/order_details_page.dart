import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import 'components/order_details_view.dart';

class OrderDetailsPage extends StatelessWidget {
  static const String id = '/order-details';

  static Route<void> route(RouteSettings settings) {
    final OrderItem orderItem = settings.arguments as OrderItem;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => OrderDetailsPage(orderItem: orderItem),
    );
  }

  const OrderDetailsPage({
    super.key,
    required this.orderItem,
  });

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) => OrderDetailsView(orderItem: orderItem);
}
