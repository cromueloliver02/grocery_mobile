import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  static const id = '/sign-up';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<SignUpCubit>(
            create: (ctx) => SignUpCubit(
              authRepository: ctx.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignUpFormBloc>(
            create: (ctx) => SignUpFormBloc(),
          ),
        ],
        child: const SignUpPage(),
      ),
    );
  }

  const SignUpPage({super.key});

  void _signupListener(BuildContext ctx, SignUpState state) {
    if (state.status == SignupStatus.failure) {
      if (state.error.code == kEmailAlreadyInUse) {
        showInfoDialog(
          ctx,
          title: 'Email Already Exist',
          message: 'Email is already taken, please try a different one.',
        );
        return;
      }

      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: _signupListener,
      child: const SignUpView(),
    );
  }
}
