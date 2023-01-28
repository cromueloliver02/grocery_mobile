import 'package:flutter/material.dart';

import 'components/wishlist_view.dart';

class WishlistPage extends StatelessWidget {
  static const String id = '/wishlist';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const WishlistPage(),
    );
  }

  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) => const WishlistView();
}
