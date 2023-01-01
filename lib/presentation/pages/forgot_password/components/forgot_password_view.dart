import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return KeyboardDismisser(
      gestures: dismissKeyboardGestures,
      child: Scaffold(
        body: SingleChildScrollView(
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
                      'Forgot Password',
                      style: textTheme.headline1!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const ForgotPasswordForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
