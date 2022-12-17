import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import './orders_page_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: OrdersPageAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          itemCount: 17,
          separatorBuilder: (ctx, idx) => const Divider(thickness: 1),
          itemBuilder: (ctx, idx) => GCRProductCard.order(
            price: 5.34,
            quantity: 2,
            date: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
