import 'package:flutter/material.dart';

import './widgets.dart';

class GCRWarningDialog extends StatelessWidget {
  const GCRWarningDialog({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

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
            style: textTheme.headline4,
          ),
        ],
      ),
      content: Text(
        message,
        style: textTheme.bodyText1,
      ),
      actions: [
        GCRButton.text(
          labelText: 'Cancel',
          onPressed: () => Navigator.pop(context, false),
        ),
        GCRButton.text(
          labelText: 'Yes',
          foregroundColor: Colors.red,
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
