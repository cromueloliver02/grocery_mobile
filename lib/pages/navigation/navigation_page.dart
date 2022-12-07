import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../cubits/cubits.dart';
import '../../pages/pages.dart';

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
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (ctx, state) => BottomNavigationBar(
          backgroundColor: Theme.of(context).cardColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: state.currentIndex,
          onTap: (index) => ctx.read<NavigationCubit>().setCurrentIndex(index),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
            ),
            BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(IconlyLight.category),
              activeIcon: Icon(IconlyBold.category),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(IconlyLight.buy),
              activeIcon: Icon(IconlyBold.buy),
            ),
            BottomNavigationBarItem(
              label: 'User',
              icon: Icon(IconlyLight.user2),
              activeIcon: Icon(IconlyBold.user2),
            ),
          ],
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (ctx, state) => IndexedStack(
          index: state.currentIndex,
          children: _pages,
        ),
      ),
    );
  }
}
