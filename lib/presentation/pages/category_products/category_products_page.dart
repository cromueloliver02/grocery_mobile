import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../pages.dart';
import './components/category_products_view.dart';

class CategoryProductsPage extends StatefulWidget {
  static const id = '${NavigationPage.id}/category-products';

  static Route<void> route(RouteSettings settings) {
    final String category = settings.arguments as String;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<CategoryProductsBloc>(
        create: (ctx) => CategoryProductsBloc(
          productList: ctx.read<ProductListBloc>().state.productList,
        ),
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
