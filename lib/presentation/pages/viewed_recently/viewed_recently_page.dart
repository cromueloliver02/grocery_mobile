import 'package:flutter/material.dart';

import 'components/viewed_recently_view.dart';

class ViewedRecentlyPage extends StatelessWidget {
  static const String id = '/viewed-recently';

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
