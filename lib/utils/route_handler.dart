import 'package:flutter/material.dart';

import '../presentation/widgets/widgets.dart';
import '../presentation/pages/pages.dart';

// generated route access blocs/cubits
class RouteHandler {
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
      case ForgetPasswordPage.id:
        return ForgetPasswordPage.route(settings);
      case NavigationPage.id:
        return NavigationPage.route(settings);
      case ProductFeedsPage.id:
        return ProductFeedsPage.route(settings);
      case OnSalePage.id:
        return OnSalePage.route(settings);
      case ProductDetailsPage.id:
        return ProductDetailsPage.route(settings);
      case CategoryProductsPage.id:
        return CategoryProductsPage.route(settings);
      case OrdersPage.id:
        return OrdersPage.route(settings);
      case OrderDetailsPage.id:
        return OrderDetailsPage.route(settings);
      case WishlistPage.id:
        return WishlistPage.route(settings);
      case ViewedRecentlyPage.id:
        return ViewedRecentlyPage.route(settings);
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
