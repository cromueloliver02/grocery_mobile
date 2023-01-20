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
    BlocProvider<LoadingBloc>(
      create: (ctx) => LoadingBloc(
        productRepository: ctx.read<ProductRepository>(),
        cartRepository: ctx.read<CartRepository>(),
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<ProductListBloc>(
      create: (ctx) => ProductListBloc(
        productRepository: ctx.read<ProductRepository>(),
      ),
    ),
    BlocProvider<ProductsOnSaleBloc>(
      create: (ctx) => ProductsOnSaleBloc(),
    ),
    BlocProvider<UserBloc>(
      create: (ctx) => UserBloc(),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc(),
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
        userBloc: ctx.read<UserBloc>(),
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<CartActionCubit>(
      create: (ctx) => CartActionCubit(
        cartBloc: ctx.read<CartBloc>(),
        cartRepository: ctx.read<CartRepository>(),
      ),
    ),
    BlocProvider<OrderActionCubit>(
      create: (ctx) => OrderActionCubit(
        orderBloc: ctx.read<OrderBloc>(),
        cartActionCubit: ctx.read<CartActionCubit>(),
        orderRepository: ctx.read<OrderRepository>(),
      ),
    ),
    BlocProvider<WishlistActionCubit>(
      create: (ctx) => WishlistActionCubit(
        wishlistBloc: ctx.read<WishlistBloc>(),
        wishlistRepository: ctx.read<WishlistRepository>(),
      ),
    ),
    BlocProvider<ViewedRecentlyActionCubit>(
      create: (ctx) => ViewedRecentlyActionCubit(
        viewedRecentlyBloc: ctx.read<ViewedRecentlyBloc>(),
      ),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
  ];
}
