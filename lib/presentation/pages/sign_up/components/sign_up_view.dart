import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';
import '../../../../utils/utils.dart';
import './sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  void _goToSigninPage(BuildContext ctx) {
    Navigator.pushReplacementNamed(ctx, SignInPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return KeyboardDismisser(
      gestures: dismissKeyboardGestures,
      child: Scaffold(
        body: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, state) {
            final bool loading = state.status == SignupStatus.loading;

            return GCRLoadingOverlay(
              loading: loading,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Stack(
                  children: [
                    const GCRAuthBackgroundCarousel(),
                    Container(
                      color: Colors.black.withOpacity(0.75),
                      height: screenSize.height,
                    ),
                    Container(
                      height: screenSize.height,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: textTheme.headline1!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Sign up to continue',
                            style: textTheme.bodyText1!.copyWith(
                              color: Colors.white,
                              fontSize: textTheme.bodyText1!.fontSize! + 2,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SignUpForm(),
                          const SizedBox(height: 15),
                          RichText(
                            text: TextSpan(
                              text: 'Already a user? ',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontSize: textTheme.bodyText1!.fontSize! + 2,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign in',
                                  style: textTheme.bodyText1!.copyWith(
                                    color: loading
                                        ? Colors.grey
                                        : Colors.lightBlue,
                                    fontSize:
                                        textTheme.bodyText1!.fontSize! + 2,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = loading
                                        ? null
                                        : () => _goToSigninPage(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
