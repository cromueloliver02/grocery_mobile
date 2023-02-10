import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../utils/utils.dart';

class OrdersPageAppBar extends StatelessWidget {
  const OrdersPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: BlocBuilder<OrderBloc, OrderState>(
        builder: (ctx, state) {
          final bool showCount = state.status != OrderStatus.loading &&
              state.order.orderItems.isNotEmpty;

          return Text(
            'Your Orders ${showCount ? '(${state.order.orderItems.length})' : ''}',
            style: textTheme.displaySmall,
          );
        },
      ),
    );
  }
}
