import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/gcr_category_card.dart';
import '../pages.dart';

class CategoryPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/category';

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: Category.categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 230 / 250,
      ),
      itemBuilder: (ctx, idx) => GCRCategoryCard(
        name: Category.categories[idx].name,
        imageUrl: Category.categories[idx].imageUrl,
        color: Category.categories[idx].color,
        onTap: () {},
      ),
    );
  }
}
