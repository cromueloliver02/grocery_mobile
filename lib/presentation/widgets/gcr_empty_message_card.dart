import 'package:flutter/material.dart';

import './widgets.dart';

class GCREmptyMessageCard extends StatelessWidget {
  const GCREmptyMessageCard({
    super.key,
    required this.image,
    required this.message,
    required this.buttonText,
    required this.onRedirect,
  });

  final String image;
  final String message;
  final String buttonText;
  final VoidCallback onRedirect;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: screenSize.width * 0.75,
            ),
            const SizedBox(height: 30),
            Text(
              'Whoops!',
              textAlign: TextAlign.center,
              style: textTheme.headline1!.copyWith(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyText1!.copyWith(
                fontSize: textTheme.bodyText1!.fontSize! + 4,
              ),
            ),
            const SizedBox(height: 20),
            GCRButton.elevated(
              labelText: buttonText,
              onPressed: onRedirect,
            ),
          ],
        ),
      ),
    );
  }
}
