import 'package:flutter/material.dart';

import './order_details_page_app_bar.dart';
import './shipping_info_section.dart';
import './order_items_list.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: OrderDetailsPageAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShippingInfoSection(),
              SizedBox(height: 25),
              OrderedItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}
