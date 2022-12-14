import 'package:flutter/material.dart';

import '../pages.dart';
import './components/on_sale_view.dart';

class OnSalePage extends StatelessWidget {
  static const id = '${HomePage.id}/on-sale';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const OnSalePage(),
    );
  }

  const OnSalePage({super.key});

  @override
  Widget build(BuildContext context) => const OnSaleView();
}
