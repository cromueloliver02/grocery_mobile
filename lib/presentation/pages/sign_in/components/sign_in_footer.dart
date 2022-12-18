import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../widgets/widgets.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'OR',
              style: textTheme.bodyText1!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: GCRButton.elevated(
            labelText: 'Continue as a Guest',
            backgroundColor: Colors.black,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: textTheme.bodyText1!.copyWith(
              color: Colors.white,
              fontSize: textTheme.bodyText1!.fontSize! + 2,
            ),
            children: [
              TextSpan(
                text: 'Sign up',
                style: textTheme.bodyText1!.copyWith(
                  color: Colors.lightBlue,
                  fontSize: textTheme.bodyText1!.fontSize! + 2,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
