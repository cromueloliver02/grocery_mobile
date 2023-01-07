import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/services/services.dart';
import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<AuthRepository>(
      create: (ctx) => AuthRepository(
        authService: AuthService(
          fireAuth: FirebaseAuth.instance,
          firestore: FirebaseFirestore.instance,
          googleSignIn: GoogleSignIn(),
        ),
      ),
    ),
    RepositoryProvider<UserRepository>(
      create: (ctx) => UserRepository(
        userService: UserService(
          firestore: FirebaseFirestore.instance,
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
        ),
      ),
    ),
  ];

  final List<BlocProvider> blocProviders = [
    BlocProvider<AuthBloc>(
      create: (ctx) => AuthBloc(
        authRepository: ctx.read<AuthRepository>(),
      )..add(AuthStarted()),
    ),
    BlocProvider<UserBloc>(
      create: (ctx) => UserBloc(
        userRepository: ctx.read<UserRepository>(),
      ),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
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
      )..add(CartStarted(userId: ctx.read<AuthBloc>().state.user!.uid)),
    ),
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc()..add(WishlistStarted()),
    ),
    BlocProvider<ViewedRecentlyBloc>(
      create: (ctx) => ViewedRecentlyBloc()..add(ViewedRecentlyStarted()),
    ),
  ];
}
