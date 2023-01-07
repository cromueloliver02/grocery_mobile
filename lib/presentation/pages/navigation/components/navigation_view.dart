import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../pages/pages.dart';
import '../../../../utils/utils.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardDismisser(
        gestures: kDismissKeyboardGestures,
        child: Scaffold(
          bottomNavigationBar: const NavigationPageBottomBar(),
          body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (ctx, state) => IndexedStack(
              index: state.currentIndex,
              children: _pages,
            ),
          ),
        ),
      ),
    );
  }
}
