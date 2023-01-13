import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/product_feeds_view.dart';

class ProductFeedsPage extends StatelessWidget {
  static const id = '/product-feeds';

  static Route<void> route(
    RouteSettings settings, {
    required ProductListBloc productListBloc,
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
          BlocProvider<ProductListBloc>.value(value: productListBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<SearchProductCubit>(
            create: (ctx) => SearchProductCubit(
              productRepository: ctx.read<ProductRepository>(),
            ),
          ),
        ],
        child: const ProductFeedsPage(),
      ),
    );
  }

  const ProductFeedsPage({super.key});

  @override
  Widget build(BuildContext context) => const FeedsView();
}
