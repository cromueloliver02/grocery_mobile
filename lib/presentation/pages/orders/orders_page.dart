import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/orders_view.dart';

class OrdersPage extends StatelessWidget {
  static void pushRoute(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
          ],
          child: const OrdersPage(),
        ),
      ),
    );
  }

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) => const OrdersView();
}
