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
          firebaseAuth: FirebaseAuth.instance,
          firebaseFirestore: FirebaseFirestore.instance,
          googleSignIn: GoogleSignIn(),
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
