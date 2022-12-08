import 'package:flutter/material.dart';

import '../../cubits/cubits.dart';
import '../../pages/pages.dart';
import './components/navigation_page_bottom_bar.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  const NavigationPage({super.key});

  final _pages = const [
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (ctx, state) => Scaffold(
        bottomNavigationBar: const NavigationPageBottomBar(),
        body: SafeArea(
          child: IndexedStack(
            index: state.currentIndex,
            children: _pages,
          ),
        ),
      ),
    );
  }
}
