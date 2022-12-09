import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

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
            'Sign Out',
            style: textTheme.headline4,
          ),
        ],
      ),
      content: Text(
        'Do you wanna sign out?',
        style: textTheme.bodyText1,
      ),
      actions: [
        GCRButton.text(
          labelText: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        GCRButton.text(
          labelText: 'Yes',
          foregroundColor: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}
