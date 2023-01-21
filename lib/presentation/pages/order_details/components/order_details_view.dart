import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import './order_details_page_app_bar.dart';
import './shipping_info_section.dart';
import './order_items_list.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.orderItem,
  });

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: OrderDetailsPageAppBar(
          orderedItemCount: orderItem.cartItems.length,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShippingInfoSection(
                customerName: orderItem.user.name,
                customerAddress: orderItem.user.shipAddress!,
                orderedAt: orderItem.createdAt,
                totalPaid: orderItem.grandTotalPrice,
              ),
              const SizedBox(height: 25),
              OrderedItemsList(cartItems: orderItem.cartItems),
            ],
          ),
        ),
      ),
    );
  }
}
