import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/wishlist_view.dart';

class WishlistPage extends StatelessWidget {
  static const id = '/wishlist';

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
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>.value(value: cartBloc),
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<AddCartItemCubit>.value(value: addCartItemCubit),
          BlocProvider<NavigationCubit>.value(value: navigationCubit),
        ],
        child: const WishlistPage(),
      ),
    );
  }

  const WishlistPage({super.key});

  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.status == WishlistStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistBloc, WishlistState>(
      listener: _wishlistListener,
      child: const WishlistView(),
    );
  }
}
