import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import './components/category_products_view.dart';

class CategoryProductsPage extends StatefulWidget {
  static const id = '/category-products';

  static Route<void> route(
    RouteSettings settings, {
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
    required ViewedRecentlyBloc viewedRecentlyBloc,
    required AddCartItemCubit addCartItemCubit,
    required NavigationCubit navigationCubit,
  }) {
    final String category = settings.arguments as String;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<CategoryProductsBloc>(
            create: (ctx) => CategoryProductsBloc(
              productList: ctx.read<ProductListBloc>().state.productList,
            ),
          ),
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<AddCartItemCubit>.value(value: addCartItemCubit),
          BlocProvider<NavigationCubit>.value(value: navigationCubit),
        ],
        child: CategoryProductsPage(category: category),
      ),
    );
  }

  const CategoryProductsPage({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  @override
  Widget build(BuildContext context) {
    return CategoryProductsView(category: widget.category);
  }

  @override
  void initState() {
    super.initState();

    context
        .read<CategoryProductsBloc>()
        .add(CategoryProductsSetted(category: widget.category));
  }
}
