import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  static const id = '/sign-in';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const SignInPage(),
    );
  }

  const SignInPage({super.key});

  void _signinListener(BuildContext ctx, SignInState state) {
    if (state.status == SigninStatus.failure) {
      if (state.error.code == kUserNotFound ||
          state.error.code == kWrongPassword) {
        FunctionHandler.showInfoDialog(
          ctx,
          title: 'Incorrect Credentials',
          message: 'Wrong email or password',
        );
        return;
      }

      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (ctx) => SignInCubit(
            authRepository: ctx.read<AuthRepository>(),
          ),
        ),
        BlocProvider<SignInFormBloc>(
          create: (ctx) => SignInFormBloc(),
        ),
      ],
      child: BlocListener<SignInCubit, SignInState>(
        listener: _signinListener,
        child: const SignInView(),
      ),
    );
  }
}
