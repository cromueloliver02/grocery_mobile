import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../cubits/cubits.dart';
import '../../pages/pages.dart';
import './components/navigation_page_bottom_bar.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  const NavigationPage({super.key});

  final _pages = const [
    Tuple2(HomePage(), 'Home Page'),
    Tuple2(CategoryPage(), 'Category Page'),
    Tuple2(CartPage(), 'Cart Page'),
    Tuple2(UserPage(), 'User Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (ctx, state) => Scaffold(
        // appBar: AppBar(
        //   title: Text(_pages[state.currentIndex].item2),
        // ),
        bottomNavigationBar: const NavigationPageBottomBar(),
        body: SafeArea(
          child: IndexedStack(
            index: state.currentIndex,
            children: _pages.map((d) => d.item1).toList(),
          ),
        ),
      ),
    );
  }
}
