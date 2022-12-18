import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  static const id = '/sign-up';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<SignUpFormBloc>(
        create: (ctx) => SignUpFormBloc(),
        child: const SignUpPage(),
      ),
    );
  }

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => const SignUpView();
}
