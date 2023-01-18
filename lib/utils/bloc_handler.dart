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
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc(),
    ),
    BlocProvider<UserBloc>(
      create: (ctx) => UserBloc(),
    ),
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc(
        wishlistRepository: ctx.read<WishlistRepository>(),
      ),
    ),
    BlocProvider<ViewedRecentlyBloc>(
      create: (ctx) => ViewedRecentlyBloc(),
    ),
    BlocProvider<CartActionCubit>(
      create: (ctx) => CartActionCubit(
        cartBloc: ctx.read<CartBloc>(),
        cartRepository: ctx.read<CartRepository>(),
      ),
    ),
    BlocProvider<WishlistActionCubit>(
      create: (ctx) => WishlistActionCubit(
        wishlistBloc: ctx.read<WishlistBloc>(),
        wishlistRepository: ctx.read<WishlistRepository>(),
      ),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
  ];
}
