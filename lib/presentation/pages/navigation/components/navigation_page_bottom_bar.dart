import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';

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
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
          ),
          const BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(IconlyLight.category),
            activeIcon: Icon(IconlyBold.category),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: badges.Badge(
              toAnimate: true,
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              position: badges.BadgePosition.topEnd(top: -7, end: -7),
              badgeContent: BlocBuilder<CartBloc, CartState>(
                builder: (ctx, state) => Text(
                  '${state.cart.cartItems.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              child: const Icon(IconlyLight.buy),
            ),
            activeIcon: badges.Badge(
              toAnimate: true,
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              position: badges.BadgePosition.topEnd(top: -7, end: -7),
              badgeContent: FittedBox(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (ctx, state) => Text(
                    '${state.cart.cartItems.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              child: const Icon(IconlyBold.buy),
            ),
          ),
          const BottomNavigationBarItem(
            label: 'User',
            icon: Icon(IconlyLight.user2),
            activeIcon: Icon(IconlyBold.user2),
          ),
        ],
      ),
    );
  }
}
