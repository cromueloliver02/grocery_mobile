import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';
import 'components/sign_in_view.dart';

class SignInPage extends StatefulWidget {
  static const String id = '/sign-in';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<SignInCubit>(
            create: (ctx) => SignInCubit(
              authRepository: ctx.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignInFormCubit>(
            create: (ctx) => SignInFormCubit(),
          ),
        ],
        child: const SignInPage(),
      ),
    );
  }

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _signinListener(BuildContext ctx, SignInState state) {
    if (state.status == SigninStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: _signinListener,
      child: const SignInView(),
    );
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }
}
