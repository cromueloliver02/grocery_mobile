import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GCRLoadingOverlay extends StatelessWidget {
  const GCRLoadingOverlay({
    super.key,
    required this.loading,
    required this.child,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        child,
        if (loading)
          Container(
            color: Colors.black.withOpacity(0.5),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpinKitSpinningLines(
                  color: Colors.white,
                  size: 150,
                ),
                const SizedBox(height: 30),
                Text(
                  'LOADING',
                  style: textTheme.headline3!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
