import 'package:flutter/material.dart';

import '../pages.dart';

class HomePage extends StatelessWidget {
  static const id = '${NavigationPage.id}/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HOME PAGE'),
    );
  }
}
