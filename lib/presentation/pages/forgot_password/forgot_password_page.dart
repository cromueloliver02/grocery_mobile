import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/forgot_password_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const id = '/forgot-password';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<ForgotPwdFormBloc>(
        create: (ctx) => ForgotPwdFormBloc(),
        child: const ForgotPasswordPage(),
      ),
    );
  }

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) => const ForgotPasswordView();
}
