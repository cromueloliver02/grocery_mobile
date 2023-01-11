import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/feeds_view.dart';

class FeedsPage extends StatelessWidget {
  static const id = '/feeds';

  static Route<void> route(
    RouteSettings settings, {
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
    required ViewedRecentlyBloc viewedRecentlyBloc,
    required AddCartItemCubit addCartItemCubit,
    required NavigationCubit navigationCubit,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<AddCartItemCubit>.value(value: addCartItemCubit),
          BlocProvider<NavigationCubit>.value(value: navigationCubit),
          BlocProvider<SearchProductCubit>(
            create: (ctx) => SearchProductCubit(
              productRepository: ctx.read<ProductRepository>(),
            ),
          )
        ],
        child: const FeedsPage(),
      ),
    );
  }

  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) => const FeedsView();
}
