import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/forgot_password_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const id = '/forgot-password';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const ForgotPasswordPage(),
    );
  }

  const ForgotPasswordPage({super.key});

  void _forgetPwdListener(BuildContext ctx, ForgetPwdState state) {
    if (state.status == ForgetPwdStatus.success) {
      Navigator.pop(ctx);
      Fluttertoast.showToast(
        msg: 'An email has been sent to you email address',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade600,
        textColor: Colors.white,
        fontSize: 16,
      );
    }

    if (state.status == ForgetPwdStatus.failure) {
      if (state.error.code == kUserNotFound) {
        FunctionHandler.showInfoDialog(
          ctx,
          title: 'Email Not Found',
          message: 'This email is not registered yet, please try to sign up.',
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
        BlocProvider<ForgetPwdCubit>(
          create: (ctx) => ForgetPwdCubit(
            authRepository: ctx.read<AuthRepository>(),
          ),
        ),
        BlocProvider<ForgotPwdFormBloc>(
          create: (ctx) => ForgotPwdFormBloc(),
        ),
      ],
      child: BlocListener<ForgetPwdCubit, ForgetPwdState>(
        listener: _forgetPwdListener,
        child: const ForgotPasswordView(),
      ),
    );
  }
}
