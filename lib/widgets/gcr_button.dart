import 'package:flutter/material.dart';

class GCRButton extends StatelessWidget {
  const GCRButton.elevated({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.cyan,
    this.loading = false,
    this.isElevated = true,
    this.isText = false,
  });

  const GCRButton.text({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.foregroundColor = Colors.cyan,
    this.backgroundColor = Colors.transparent,
    this.loading = false,
    this.isElevated = false,
    this.isText = true,
  });

  final String labelText;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool loading;
  final bool isElevated;
  final bool isText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isElevated) {
      return ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: Colors.grey,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loading) ...[
              SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(width: 15),
            ],
            Text(labelText),
          ],
        ),
      );
    }

    if (isText) {
      return TextButton(
        onPressed: loading ? null : onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: Colors.grey,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loading) ...[
              const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 15),
            ],
            Text(labelText),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
