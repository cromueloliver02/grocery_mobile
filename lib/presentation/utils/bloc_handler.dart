import '../../business_logic/blocs/blocs.dart';
import '../../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
    BlocProvider<ProductListBloc>(
      create: (ctx) => ProductListBloc()..add(ProductListStarted()),
    ),
    BlocProvider<ProductsOnSaleBloc>(
      create: (ctx) => ProductsOnSaleBloc(),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc()..add(CartStarted()),
    ),
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc()..add(WishlistStarted()),
    ),
    BlocProvider<ViewedRecentlyBloc>(
      create: (ctx) => ViewedRecentlyBloc()..add(ViewedRecentlyStarted()),
    ),
  ];
}
