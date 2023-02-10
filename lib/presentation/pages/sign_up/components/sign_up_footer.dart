import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../../utils/utils.dart';
import '../../pages.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (ctx, state) {
        final bool loading = state.status == SignupStatus.loading;

        return RichText(
          text: TextSpan(
            text: 'Already a user? ',
            style: textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: textTheme.bodyLarge!.fontSize! + 2,
            ),
            children: [
              TextSpan(
                text: 'Sign in',
                style: textTheme.bodyLarge!.copyWith(
                  color: loading ? Colors.grey : Colors.lightBlue,
                  fontSize: textTheme.bodyLarge!.fontSize! + 2,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = loading
                      ? null
                      : () =>
                          Navigator.pushReplacementNamed(ctx, SignInPage.id),
              ),
            ],
          ),
        );
      },
    );
  }
}
