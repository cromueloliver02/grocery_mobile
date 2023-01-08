import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../pages.dart';
import '../../../utils/utils.dart';
import './components/splash_view.dart';

class SplashPage extends StatefulWidget {
  static const id = '/splash';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const SplashPage(),
    );
  }

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _authListener(BuildContext ctx, AuthState state) {
    if (state.status == AuthStatus.unauthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        ctx,
        SignInPage.id,
        (Route route) => route.settings.name == SplashPage.id,
      );
    }

    if (state.status == AuthStatus.authenticated) {
      Navigator.pushNamed(ctx, NavigationPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authListener,
      child: const SplashView(),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthStarted());
  }
}
