import 'package:flutter/material.dart';

import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../presentation/widgets/widgets.dart';
import '../presentation/pages/pages.dart';

class RouteHandler {
  final UserRepository userRepository;
  final UserBloc _userBloc;
  final WishlistBloc _wishlistBloc;

  RouteHandler({
    required this.userRepository,
  })  : _userBloc = UserBloc(userRepository: userRepository),
        _wishlistBloc = WishlistBloc();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.id:
        return SplashPage.route(settings);
      case LoadingPage.id:
        return LoadingPage.route(settings);
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
  }
}
