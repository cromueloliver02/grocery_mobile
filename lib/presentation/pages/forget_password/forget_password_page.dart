import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import 'components/forget_password_view.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const String id = '/forget-password';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<ForgetPwdCubit>(
            create: (ctx) => ForgetPwdCubit(
              authRepository: ctx.read<AuthRepository>(),
            ),
          ),
          BlocProvider<ForgetPwdFormCubit>(
            create: (ctx) => ForgetPwdFormCubit(),
          ),
        ],
        child: const ForgetPasswordPage(),
      ),
    );
  }

  const ForgetPasswordPage({super.key});

  void _forgetPwdListener(BuildContext ctx, ForgetPwdState state) {
    if (state.status == ForgetPwdStatus.success) {
      Navigator.pop(ctx);
      showToast('An email has been sent to you email address');
    }

    if (state.status == ForgetPwdStatus.failure) {
      if (state.error.code == kUserNotFound) {
        showInfoDialog(
          ctx,
          title: 'Email Not Found',
          message: 'This email is not registered yet, please try to sign up.',
        );
        return;
      }

      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPwdCubit, ForgetPwdState>(
      listener: _forgetPwdListener,
      child: const ForgetPasswordView(),
    );
  }
}
