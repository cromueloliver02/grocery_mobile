import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import './components/feed_view.dart';

class FeedPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/feed';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const FeedPage(),
    );
  }

  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchProductCubit>(
      create: (ctx) => SearchProductCubit(
        productRepository: ctx.read<ProductRepository>(),
      ),
      child: const FeedView(),
    );
  }
}
