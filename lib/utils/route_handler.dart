import 'package:flutter/material.dart';

import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';
import '../presentation/widgets/widgets.dart';
import '../presentation/pages/pages.dart';

class RouteHandler {
  final UserBloc _userBloc;
  final WishlistBloc _wishlistBloc;
  final ViewedRecentlyBloc _viewedRecentlyBloc;
  final AddCartItemCubit _addCartItemCubit;
  final NavigationCubit _navigationCubit;

  RouteHandler({
    required UserRepository userRepository,
    required CartRepository cartRepository,
  })  : _userBloc = UserBloc(userRepository: userRepository),
        _wishlistBloc = WishlistBloc(),
        _viewedRecentlyBloc = ViewedRecentlyBloc(),
        _addCartItemCubit = AddCartItemCubit(cartRepository: cartRepository),
        _navigationCubit = NavigationCubit();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.id:
        return SplashPage.route(settings);
      case LoadingPage.id:
        return LoadingPage.route(
          settings,
          userBloc: _userBloc,
        );
      case SignInPage.id:
        return SignInPage.route(settings);
      case SignUpPage.id:
        return SignUpPage.route(settings);
      case ForgotPasswordPage.id:
        return ForgotPasswordPage.route(settings);
      case NavigationPage.id:
        return NavigationPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case FeedsPage.id:
        return FeedsPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case OnSalePage.id:
        return OnSalePage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case ProductDetailsPage.id:
        return ProductDetailsPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case CategoryProductsPage.id:
        return CategoryProductsPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case OrdersPage.id:
        return OrdersPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case WishlistPage.id:
        return WishlistPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
      case ViewedRecentlyPage.id:
        return ViewedRecentlyPage.route(
          settings,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          addCartItemCubit: _addCartItemCubit,
          navigationCubit: _navigationCubit,
        );
    }

    return null;
  }

  Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/not-found.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              Text(
                '404: Page Not Found',
                style: Theme.of(ctx).textTheme.headline5,
              ),
              const SizedBox(height: 30),
              GCRButton.elevated(
                labelText: 'Go Back',
                onPressed: () => Navigator.pop(ctx),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispose() {
    _userBloc.close();
    _wishlistBloc.close();
    _viewedRecentlyBloc.close();
    _addCartItemCubit.close();
    _navigationCubit.close();
  }
}
