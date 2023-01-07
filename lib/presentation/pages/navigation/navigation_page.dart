import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const NavigationPage(),
    );
  }

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (ctx) => ProductListBloc(
            productRepository: ctx.read<ProductRepository>(),
          )..add(ProductListStarted()),
        ),
        BlocProvider<ProductsOnSaleBloc>(
          create: (ctx) => ProductsOnSaleBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (ctx) => UserBloc(
            userRepository: ctx.read<UserRepository>(),
          )..add(UserStarted(userId: ctx.read<AuthBloc>().state.user!.uid)),
        ),
        BlocProvider<CartBloc>(
          create: (ctx) => CartBloc(
            cartRepository: ctx.read<CartRepository>(),
          )..add(CartStarted(userId: ctx.read<AuthBloc>().state.user!.uid)),
        ),
        BlocProvider<WishlistBloc>(
          create: (ctx) => WishlistBloc()..add(WishlistStarted()),
        ),
        BlocProvider<ViewedRecentlyBloc>(
          create: (ctx) => ViewedRecentlyBloc()..add(ViewedRecentlyStarted()),
        ),
        BlocProvider<NavigationCubit>(
          create: (ctx) => NavigationCubit(),
        ),
      ],
      child: NavigationView(),
    );
  }
}
