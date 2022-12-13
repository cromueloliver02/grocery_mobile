import 'package:flutter/material.dart';

import '../pages.dart';
import './components/category_view.dart';

class CategoryPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/category';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const CategoryPage(),
    );
  }

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) => const CategoryView();
}
