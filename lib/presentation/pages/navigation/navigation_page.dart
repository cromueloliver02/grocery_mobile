import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../data/repositories/repositories.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatefulWidget {
  static const id = '/navigation';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const NavigationPage(),
    );
  }

  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
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
        BlocProvider<CartBloc>(
          create: (ctx) => CartBloc(
            cartRepository: ctx.read<CartRepository>(),
            // TODO: why id in user state of userbloc is empty?
          )..add(CartStarted(userId: context.read<AuthBloc>().state.user!.uid)),
        ),
        BlocProvider<WishlistBloc>(
          create: (ctx) => WishlistBloc()..add(WishlistStarted()),
        ),
      ],
      child: NavigationView(),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<ViewedRecentlyBloc>().add(ViewedRecentlyStarted());
  }
}
