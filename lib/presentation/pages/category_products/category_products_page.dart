import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/category_products_view.dart';

class CategoryProductsPage extends StatelessWidget {
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
