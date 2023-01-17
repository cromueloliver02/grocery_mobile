import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';
import '../utils/utils.dart';

class RepositoryHandler {
  final List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<AuthRepository>(
      create: (ctx) => AuthRepository(authService: authService),
    ),
    RepositoryProvider<ProductRepository>(
      create: (ctx) => ProductRepository(productService: productService),
    ),
    RepositoryProvider<CartRepository>(
      create: (ctx) => CartRepository(
        cartService: cartService,
        productService: productService,
      ),
    ),
    RepositoryProvider<UserRepository>(
      create: (ctx) => UserRepository(userService: userService),
    ),
    RepositoryProvider<WishlistRepository>(
      create: (ctx) => WishlistRepository(wishlistService: wishlistService),
    ),
  ];
}
