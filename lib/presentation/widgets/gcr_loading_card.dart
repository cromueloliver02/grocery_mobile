import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GCRLoading extends StatelessWidget {
  const GCRLoading({
    super.key,
    this.loadingText = 'LOADING...',
  });

  final String loadingText;

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
            const SpinKitFadingCube(
              color: Colors.blue,
              size: 50.0,
            ),
            const SizedBox(height: 40),
            Text(
              loadingText,
              style: textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
