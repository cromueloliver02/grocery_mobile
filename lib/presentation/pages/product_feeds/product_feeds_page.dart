import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_feeds_view.dart';

class ProductFeedsPage extends StatelessWidget {
  static const String id = '/product-feeds';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<SearchProductCubit>(
        create: (ctx) => SearchProductCubit(
          productRepository: ctx.read<ProductRepository>(),
        ),
        child: const ProductFeedsPage(),
      ),
    );
  }

  const ProductFeedsPage({super.key});

  void _searchListener(BuildContext ctx, SearchProductState state) {
    if (state.status == SearchProductStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchProductCubit, SearchProductState>(
      listener: _searchListener,
      child: const FeedsView(),
    );
  }
}
