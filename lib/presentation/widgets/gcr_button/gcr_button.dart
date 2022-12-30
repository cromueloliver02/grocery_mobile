import 'package:flutter/material.dart';

import '../../utils/utils.dart';

part './elevated_button.dart';
part './text_button.dart';

class GCRButton extends StatelessWidget {
  const GCRButton.elevated({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.loading = false,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.cyan,
    this.type = ButtonType.elevated,
  });

  const GCRButton.text({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.loading = false,
    this.foregroundColor = Colors.cyan,
    this.backgroundColor = Colors.transparent,
    this.type = ButtonType.text,
  });

  final String labelText;
  final VoidCallback? onPressed;
  final bool loading;
  final Color foregroundColor;
  final Color backgroundColor;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.elevated) {
      return _ElevatedButton(
        labelText: labelText,
        onPressed: onPressed,
        loading: loading,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
      );
    }

    if (type == ButtonType.text) {
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
