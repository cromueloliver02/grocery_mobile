import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/category_products_view.dart';

class CategoryProductsPage extends StatelessWidget {
  static void pushRoute(BuildContext ctx, {required int idx}) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductListBloc>.value(
              value: ctx.read<ProductListBloc>(),
            ),
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<UserBloc>.value(
              value: ctx.read<UserBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: ctx.read<NavigationCubit>(),
            ),
          ],
          child: CategoryProductsPage(category: Category.categories[idx].name),
        ),
      ),
    );
  }

  const CategoryProductsPage({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryProductsBloc>(
      create: (ctx) => CategoryProductsBloc(
        productList: ctx.read<ProductListBloc>().state.productList,
      )..add(CategoryProductsSetted(category: category)),
      child: CategoryProductsView(category: category),
    );
  }
}
