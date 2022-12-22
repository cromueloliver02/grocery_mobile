import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GCRErrorCard extends StatelessWidget {
  const GCRErrorCard({
    super.key,
    this.errorText = 'Someting went wrong',
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: screenSize.width,
        minHeight: screenSize.width,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Lottie.network(
                'https://assets5.lottiefiles.com/temp/lf20_QYm9j9.json',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'ERROR',
              textAlign: TextAlign.center,
              style: textTheme.headline5,
            ),
            const SizedBox(height: 5),
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
