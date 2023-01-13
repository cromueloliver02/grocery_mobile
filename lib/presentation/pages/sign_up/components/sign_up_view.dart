import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './sign_up_form.dart';
import './sign_up_footer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardDismisser(
        gestures: kDismissKeyboardGestures,
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
                            const SignUpFooter(),
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
      ),
    );
  }
}
