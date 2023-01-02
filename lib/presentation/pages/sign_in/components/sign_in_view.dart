import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './sign_in_form.dart';
import './sign_in_footer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return KeyboardDismisser(
      gestures: dismissKeyboardGestures,
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (ctx, state) => Scaffold(
          body: GCRLoadingOverlay(
            loading: state.status == SigninStatus.loading,
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
                          'Welcome Back',
                          style: textTheme.headline1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Sign in to continue',
                          style: textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontSize: textTheme.bodyText1!.fontSize! + 2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const SignInForm(),
                        const SizedBox(height: 10),
                        GCRGoogleButton(onPressed: () {}),
                        const SizedBox(height: 20),
                        const SignInFooter(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
