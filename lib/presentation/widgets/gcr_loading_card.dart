import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GCRLoadingCard extends StatelessWidget {
  const GCRLoadingCard({
    super.key,
    this.loadingText = 'LOADING...',
  });

  final String loadingText;

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
            const SpinKitFadingCube(
              color: Colors.blue,
              size: 50.0,
            ),
            const SizedBox(height: 40),
            Text(
              loadingText,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
