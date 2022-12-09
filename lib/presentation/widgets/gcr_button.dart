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
    this.loading = false,
    this.foregroundColor = Colors.cyan,
    this.backgroundColor = Colors.transparent,
    this.isElevated = false,
    this.isText = true,
  });

  final String labelText;
  final VoidCallback? onPressed;
  final bool loading;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool isElevated;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    if (isElevated) {
      return _ElevatedButton(
        labelText: labelText,
        onPressed: onPressed,
        loading: loading,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
      );
    }

    if (isText) {
      return _TextButton(
        labelText: labelText,
        onPressed: onPressed,
        loading: loading,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
      );
    }

    return const SizedBox.shrink();
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.loading,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  final String labelText;
  final VoidCallback? onPressed;
  final bool loading;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: loading ? null : onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(
          fontSize: 16,
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
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.loading,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  final String labelText;
  final VoidCallback? onPressed;
  final bool loading;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: Colors.grey,
        textStyle: const TextStyle(
          fontSize: 16,
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
}
