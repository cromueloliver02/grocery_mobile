import 'package:flutter/material.dart';

import './widgets.dart';

class GCREmptyMessageCard extends StatelessWidget {
  const GCREmptyMessageCard({
    super.key,
    this.image = 'assets/images/box.png',
    this.message = 'Nothing to see here',
    this.buttonText = 'Go Back',
    required this.onRedirect,
  });

  final String image;
  final String message;
  final String buttonText;
  final VoidCallback onRedirect;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenSize.width),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: screenSize.width * 0.5,
            ),
            const SizedBox(height: 10),
            Text(
              'Whoops!',
              textAlign: TextAlign.center,
              style: textTheme.headline1!.copyWith(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
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
