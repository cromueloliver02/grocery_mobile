import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/on_sale_view.dart';

class OnSalePage extends StatelessWidget {
  static void pushRoute(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductsOnSaleBloc>.value(
              value: ctx.read<ProductsOnSaleBloc>(),
            ),
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<UserBloc>.value(
              value: ctx.read<UserBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: ctx.read<NavigationCubit>(),
            ),
          ],
          child: const OnSalePage(),
        ),
      ),
    );
  }

  const OnSalePage({super.key});

  @override
  Widget build(BuildContext context) => const OnSaleView();
}
