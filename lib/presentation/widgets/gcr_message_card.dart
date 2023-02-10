import 'package:flutter/material.dart';

class GCRMessageCard extends StatelessWidget {
  const GCRMessageCard({
    super.key,
    this.message = 'Nothing to show here',
    this.imageUrl = 'assets/images/box.png',
  });

  final String message;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenSize.width),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: screenSize.width * 0.5,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 25),
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
