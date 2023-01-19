import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './orders_page_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  void _goToHomePage(BuildContext ctx) {
    Navigator.pop(ctx);
    ctx.read<NavigationCubit>().setCurrentIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: OrdersPageAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (ctx, state) {
            if (state.status == OrderStatus.initial) {
              return const SizedBox.shrink();
            }

            if (state.status == OrderStatus.loading) {
              return const GCRLoadingCard();
            }

            if (state.status == OrderStatus.failure) {
              return const GCRErrorCard();
            }

            if (state.order.orderItems.isEmpty) {
              return GCREmptyMessageCard(
                image: 'assets/images/cart.png',
                message: 'You have no pending orders.',
                buttonText: 'Shop Now',
                onRedirect: () => _goToHomePage(context),
              );
            }

            return ListView.separated(
              itemCount: state.order.orderItems.length,
              separatorBuilder: (ctx, idx) => const Divider(thickness: 1),
              itemBuilder: (ctx, idx) => GCROrderCard(
                orderItem: state.order.orderItems[idx],
              ),
            );
          },
        ),
      ),
    );
  }
}
