import 'package:flutter/material.dart';

import '../../../business_logic/cubits/cubits.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider(
        create: (ctx) => NavigationCubit(),
        child: const NavigationPage(),
      ),
    );
  }

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) => NavigationView();
}
