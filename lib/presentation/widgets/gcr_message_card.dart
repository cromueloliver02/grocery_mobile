import 'package:flutter/material.dart';

class GCRMessageCard extends StatelessWidget {
  const GCRMessageCard({
    super.key,
    required this.message,
    required this.imageUrl,
  });

  final String message;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
