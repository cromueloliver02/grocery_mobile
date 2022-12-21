import 'package:flutter/material.dart';

import '../pages.dart';
import './components/viewed_recently_view.dart';

class ViewedRecentlyPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/viewed-recently';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const ViewedRecentlyPage(),
    );
  }

  const ViewedRecentlyPage({super.key});

  @override
  Widget build(BuildContext context) => const ViewedRecentlyView();
}
