import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/orders_view.dart';

class OrdersPage extends StatelessWidget {
  static const id = '/orders';

  static Route<void> route(
    RouteSettings settings, {
    required CartBloc cartBloc,
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
    required ViewedRecentlyBloc viewedRecentlyBloc,
    required AddCartItemCubit addCartItemCubit,
    required NavigationCubit navigationCubit,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const OrdersPage(),
    );
  }

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) => const OrdersView();
}
