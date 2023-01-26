import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    // GLOBAL ACCESS BLOCS/CUBITS
    BlocProvider<AuthBloc>(
      create: (ctx) => AuthBloc(
        authRepository: ctx.read<AuthRepository>(),
      ),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
    // GENERATED ROUTE ACCESS BLOCS/CUBITS
    BlocProvider<ProductListBloc>(
      create: (ctx) => ProductListBloc(
        productRepository: ctx.read<ProductRepository>(),
      ),
    ),
    BlocProvider<ProductsOnSaleBloc>(
      create: (ctx) => ProductsOnSaleBloc(),
    ),
    BlocProvider<UserBloc>(
      create: (ctx) => UserBloc(
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc(
        cartRepository: ctx.read<CartRepository>(),
      ),
    ),
    BlocProvider<OrderBloc>(
      create: (ctx) => OrderBloc(
        orderRepository: ctx.read<OrderRepository>(),
      ),
    ),
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc(
        wishlistRepository: ctx.read<WishlistRepository>(),
      ),
    ),
    BlocProvider<ViewedRecentlyBloc>(
      create: (ctx) => ViewedRecentlyBloc(),
    ),
    BlocProvider<UserActionCubit>(
      create: (ctx) => UserActionCubit(
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<CartActionCubit>(
      create: (ctx) => CartActionCubit(
        cartRepository: ctx.read<CartRepository>(),
      ),
    ),
    BlocProvider<OrderActionCubit>(
      create: (ctx) => OrderActionCubit(
        orderRepository: ctx.read<OrderRepository>(),
      ),
    ),
    BlocProvider<WishlistActionCubit>(
      create: (ctx) => WishlistActionCubit(
        wishlistRepository: ctx.read<WishlistRepository>(),
      ),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
  ];
}
