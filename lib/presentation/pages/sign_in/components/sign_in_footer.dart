import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../../business_logic/cubits/cubits.dart';
// import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';
import '../../../../utils/utils.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SignInCubit, SignInState>(
      builder: (ctx, state) {
        final bool loading = state.status == SigninStatus.loading;

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
                  style: textTheme.bodyLarge!.copyWith(
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
            // SizedBox(
            //   width: double.infinity,
            //   child: GCRButton.elevated(
            //     labelText: 'Continue as a Guest',
            //     backgroundColor: Colors.black,
            //     onPressed: loading ? null : () {},
            //   ),
            // ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: textTheme.bodyLarge!.fontSize! + 2,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: textTheme.bodyLarge!.copyWith(
                      color: loading ? Colors.grey : Colors.lightBlue,
                      fontSize: textTheme.bodyLarge!.fontSize! + 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = loading
                          ? null
                          : () => Navigator.pushReplacementNamed(
                                ctx,
                                SignUpPage.id,
                              ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
