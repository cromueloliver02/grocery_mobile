import 'package:flutter/material.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import '../../../utils/utils.dart';
import 'components/loading_view.dart';

class LoadingPage extends StatefulWidget {
  static const id = '/loading';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const LoadingPage(),
    );
  }

  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void _signinListener(BuildContext ctx, SignInState state) {
    if (state.status == SigninStatus.success) {
      debugPrint('REDIRECT FROM MANUAL-SIGNING IN');

      Navigator.pushReplacementNamed(ctx, NavigationPage.id);
    }
  }

  void _signupListener(BuildContext ctx, SignUpState state) {
    if (state.status == SignupStatus.success) {
      debugPrint('REDIRECT FROM MANUAL-SIGNING UP');

      Navigator.pushReplacementNamed(ctx, NavigationPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignInCubit, SignInState>(
          listener: _signinListener,
        ),
        BlocListener<SignUpCubit, SignUpState>(
          listener: _signupListener,
        ),
      ],
      child: const LoadingView(),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final bool isAutoSignin =
          context.read<SignInCubit>().state.status == SigninStatus.initial &&
              context.read<SignUpCubit>().state.status == SignupStatus.initial;

      debugPrint(
        'SIGN IN STATUS init ${context.read<SignInCubit>().state.status}',
      );
      debugPrint(
        'SIGN UP STATUS init ${context.read<SignUpCubit>().state.status}',
      );

      if (isAutoSignin) {
        debugPrint('REDIRECT FROM AUTO-SIGNING IN');
        Navigator.pushReplacementNamed(context, NavigationPage.id);
      }
    });
  }
}
