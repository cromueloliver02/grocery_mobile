import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
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
      ),
    );
  }
}
