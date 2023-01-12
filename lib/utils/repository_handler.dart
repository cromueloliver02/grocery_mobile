import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';
import '../utils/utils.dart';

class RepositoryHandler {
  final ProductRepository productRepository;
  final CartRepository cartRepository;
  final UserRepository userRepository;

  RepositoryHandler()
      : productRepository = ProductRepository(
          productService: productService,
        ),
        cartRepository = CartRepository(
          cartService: cartService,
          productService: productService,
        ),
        userRepository = UserRepository(
          userService: userService,
        );

  List<RepositoryProvider> repositoryProviders() {
    return [
      RepositoryProvider<AuthRepository>(
        create: (ctx) => AuthRepository(authService: authService),
      ),
      RepositoryProvider<ProductRepository>.value(value: productRepository),
      RepositoryProvider<CartRepository>.value(value: cartRepository),
      RepositoryProvider<UserRepository>.value(value: userRepository),
    ];
  }
}
