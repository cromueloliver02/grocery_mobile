import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../pages/pages.dart';
import './navigation_page_bottom_bar.dart';

class NavigationView extends StatelessWidget {
  NavigationView({Key? key}) : super(key: key);

  final _pages = [
    const HomePage(),
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
