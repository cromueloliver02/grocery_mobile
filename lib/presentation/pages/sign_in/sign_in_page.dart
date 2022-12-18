import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  static const id = '/sign-in';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<SignInFormBloc>(
        create: (ctx) => SignInFormBloc(),
        child: const SignInPage(),
      ),
    );
  }

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => const SignInView();
}
