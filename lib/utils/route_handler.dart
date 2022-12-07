import 'package:flutter/material.dart';

import '../pages/pages.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    NavigationPage.id: (ctx) => const NavigationPage(),
    HomePage.id: (ctx) => const HomePage(),
    CategoryPage.id: (ctx) => const CategoryPage(),
    CartPage.id: (ctx) => const CartPage(),
    UserPage.id: (ctx) => const UserPage(),
  };
}
