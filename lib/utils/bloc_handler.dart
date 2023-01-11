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
    // TODO: to sink deeper to navigation page level
    BlocProvider<ProductsOnSaleBloc>(
      create: (ctx) => ProductsOnSaleBloc(),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
  ];
}
