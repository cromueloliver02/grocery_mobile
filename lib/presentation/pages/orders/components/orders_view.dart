import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
// import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './orders_page_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  // void _goToHomePage(BuildContext ctx) {
  //   Navigator.pop(ctx);
  //   ctx.read<NavigationCubit>().setCurrentIndex(0);
  // }

  @override
  Widget build(BuildContext context) {
    // if (true) {
    //   return Scaffold(
    //     body: GCREmptyMessageCard(
    //       image: 'assets/images/cart.png',
    //       message: 'Your order list is empty.',
    //       buttonText: 'Order Now',
    //       onRedirect: () => _goToHomePage(context),
    //     ),
    //   );
    // }

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
          itemBuilder: (ctx, idx) => GCROrderCard(
            product: Product.productList[0],
            quantity: 2,
            date: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
