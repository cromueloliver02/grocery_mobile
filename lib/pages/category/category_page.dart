import 'package:flutter/material.dart';

import '../../widgets/gcr_category_card.dart';
import '../pages.dart';

class CategoryPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/category';

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GCRCategoryCard(onTap: () {}),
    );
  }
}
