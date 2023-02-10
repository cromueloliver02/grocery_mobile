import 'package:flutter/material.dart';

import 'widgets.dart';

class GCRInfoDialog extends StatelessWidget {
  const GCRInfoDialog({
    super.key,
    required this.title,
    required this.message,
    this.okText = 'Ok',
  });

  final String title;
  final String message;
  final String okText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Image.asset(
            'assets/images/warning-sign.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: textTheme.headlineMedium,
          ),
        ],
      ),
      content: Text(
        message,
        style: textTheme.bodyLarge,
      ),
      actions: [
        GCRButton.text(
          labelText: okText,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
