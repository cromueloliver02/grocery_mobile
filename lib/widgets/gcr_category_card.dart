import 'package:flutter/material.dart';

class GCRCategoryCard extends StatelessWidget {
  const GCRCategoryCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.red.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: screenSize.width / 3,
              height: screenSize.width / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/category/veg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Category Name',
              style: textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
