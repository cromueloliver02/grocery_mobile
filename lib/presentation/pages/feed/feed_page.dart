import 'package:flutter/material.dart';

import '../pages.dart';
import './components/feed_view.dart';

class FeedPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/feed';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const FeedPage(),
    );
  }

  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) => const FeedView();
}
