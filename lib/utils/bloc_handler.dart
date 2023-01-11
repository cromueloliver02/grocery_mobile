import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<AuthBloc>(
      create: (ctx) => AuthBloc(
        authRepository: ctx.read<AuthRepository>(),
      ),
    ),
    BlocProvider<AppBloc>(
      create: (ctx) => AppBloc(
        productRepository: ctx.read<ProductRepository>(),
        cartRepository: ctx.read<CartRepository>(),
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<ProductListBloc>(
      lazy: false,
      create: (ctx) => ProductListBloc(
        productRepository: ctx.read<ProductRepository>(),
      ),
    ),
    BlocProvider<ProductsOnSaleBloc>(
      create: (ctx) => ProductsOnSaleBloc(),
    ),
    // TODO: to sink deeper to navigation page level
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc(
        cartRepository: ctx.read<CartRepository>(),
      ),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
  ];
}
