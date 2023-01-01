import 'package:flutter/material.dart';

import '../presentation/widgets/widgets.dart';
import '../presentation/pages/pages.dart';

class RouteHandler {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.id:
        return SplashPage.route(settings);
      case SignInPage.id:
        return SignInPage.route(settings);
      case SignUpPage.id:
        return SignUpPage.route(settings);
      case ForgotPasswordPage.id:
        return ForgotPasswordPage.route(settings);
      case NavigationPage.id:
        return NavigationPage.route(settings);
      case OnSalePage.id:
        return OnSalePage.route(settings);
      case FeedPage.id:
        return FeedPage.route(settings);
      case ProductDetailsPage.id:
        return ProductDetailsPage.route(settings);
      case WishlistPage.id:
        return WishlistPage.route(settings);
      case OrdersPage.id:
        return OrdersPage.route(settings);
      case ViewedRecentlyPage.id:
        return ViewedRecentlyPage.route(settings);
      case CategoryProductsPage.id:
        return CategoryProductsPage.route(settings);
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
}
