import 'package:flutter/material.dart';

class GCRCategoryCard extends StatelessWidget {
  const GCRCategoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.onTap,
  });

  final String name;
  final String imageUrl;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
