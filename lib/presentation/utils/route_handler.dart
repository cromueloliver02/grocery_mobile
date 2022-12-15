import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../pages/pages.dart';

class RouteHandler {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPage.id:
        return NavigationPage.route(settings);
      case HomePage.id:
        return HomePage.route(settings);
      case CategoryPage.id:
        return CategoryPage.route(settings);
      case CartPage.id:
        return CartPage.route(settings);
      case UserPage.id:
        return UserPage.route(settings);
      case OnSalePage.id:
        return OnSalePage.route(settings);
      case FeedPage.id:
        return FeedPage.route(settings);
      case ProductDetailsPage.id:
        return ProductDetailsPage.route(settings);
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
