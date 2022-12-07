import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../cubits/cubits.dart';

class NavigationPageBottomBar extends StatelessWidget {
  const NavigationPageBottomBar({super.key});

  void _onChangeIndex(BuildContext ctx, int index) {
    ctx.read<NavigationCubit>().setCurrentIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (ctx, state) => BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: state.currentIndex,
        onTap: (index) => _onChangeIndex(context, index),
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
    );
  }
}
