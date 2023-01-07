import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/feed_view.dart';

class FeedPage extends StatelessWidget {
  static void pushRoute(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductListBloc>.value(
              value: ctx.read<ProductListBloc>(),
            ),
            BlocProvider<UserBloc>.value(
              value: ctx.read<UserBloc>(),
            ),
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
            BlocProvider<AddCartItemCubit>.value(
              value: ctx.read<AddCartItemCubit>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: ctx.read<NavigationCubit>(),
            ),
          ],
          child: const FeedPage(),
        ),
      ),
    );
  }

  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchProductCubit>(
      create: (ctx) => SearchProductCubit(
        productRepository: ctx.read<ProductRepository>(),
      ),
      child: const FeedView(),
    );
  }
}
