import 'package:flutter/material.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import './components/user_view.dart';

class UserPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/user';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<ThemeCubit>.value(
        value: ctx.read<ThemeCubit>(),
        child: const UserPage(),
      ),
    );
  }

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) => const UserView();
}
