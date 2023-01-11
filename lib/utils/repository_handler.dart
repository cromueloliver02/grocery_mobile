import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/services/services.dart';
import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class RepositoryHandler {
  final ProductRepository productRepository;
  final CartRepository cartRepository;
  final UserRepository userRepository;

  RepositoryHandler({
    required CartService cartService,
    required UserService userService,
    required ProductService productService,
  })  : productRepository = ProductRepository(productService: productService),
        cartRepository = CartRepository(
          cartService: cartService,
          productService: productService,
        ),
        userRepository = UserRepository(userService: userService);

  List<RepositoryProvider> repositoryProviders() {
    return [
      RepositoryProvider<AuthRepository>(
        create: (ctx) => AuthRepository(
          authService: AuthService(
            fireAuth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
            googleSignIn: GoogleSignIn(),
            userService: UserService(
              firestore: FirebaseFirestore.instance,
            ),
            cartService: CartService(
              firestore: FirebaseFirestore.instance,
              productService: ProductService(
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
        ),
      ),
      RepositoryProvider<ProductRepository>(
        create: (ctx) => ProductRepository(
          productService: ProductService(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
      RepositoryProvider<CartRepository>(
        create: (ctx) => CartRepository(
          cartService: CartService(
            firestore: FirebaseFirestore.instance,
            productService: ProductService(
              firestore: FirebaseFirestore.instance,
            ),
          ),
          productService: ProductService(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
      RepositoryProvider<UserRepository>.value(value: userRepository),
    ];
  }
}
