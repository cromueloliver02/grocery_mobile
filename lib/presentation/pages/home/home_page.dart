import 'package:flutter/material.dart';

import '../pages.dart';
import './components/home_view.dart';

class HomePage extends StatelessWidget {
  static const id = '${NavigationPage.id}/home';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const HomePage(),
    );
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomeView();
}
