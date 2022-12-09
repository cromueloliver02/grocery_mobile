import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../../pages/pages.dart';
import './components/navigation_page_bottom_bar.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  NavigationPage({super.key});

  final _pages = [
    HomePage(),
    const CategoryPage(),
    const CartPage(),
    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (ctx, state) => KeyboardDismisser(
        gestures: const [
          GestureType.onDoubleTap,
          GestureType.onPanUpdateDownDirection,
        ],
        child: Scaffold(
          bottomNavigationBar: const NavigationPageBottomBar(),
          body: IndexedStack(
            index: state.currentIndex,
            children: _pages,
          ),
        ),
      ),
    );
  }
}
