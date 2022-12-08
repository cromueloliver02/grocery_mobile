import 'package:flutter/material.dart';

import '../pages/pages.dart';
import '../widgets/widgets.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    NavigationPage.id: (ctx) => const NavigationPage(),
    HomePage.id: (ctx) => const HomePage(),
    CategoryPage.id: (ctx) => const CategoryPage(),
    CartPage.id: (ctx) => const CartPage(),
    UserPage.id: (ctx) => const UserPage(),
  };

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
