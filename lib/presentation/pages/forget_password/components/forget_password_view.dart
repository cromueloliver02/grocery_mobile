import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import 'forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return KeyboardDismisser(
      gestures: kDismissKeyboardGestures,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<ForgetPwdCubit, ForgetPwdState>(
          builder: (ctx, state) => GCRLoadingOverlay(
            loading: state.status == ForgetPwdStatus.loading,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 150),
                        Text(
                          'Forget Password',
                          style: textTheme.displayLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const ForgetPasswordForm(),
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
