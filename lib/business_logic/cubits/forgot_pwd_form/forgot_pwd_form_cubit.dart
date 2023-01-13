import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

import '../cubits.dart';

part 'forgot_pwd_form_state.dart';

class ForgotPwdFormCubit extends Cubit<ForgotPwdFormState> {
  ForgotPwdFormCubit() : super(ForgotPwdFormState.initial());

  void forgetPassword(
    BuildContext ctx, {
    required GlobalKey<FormState> formKey,
  }) {
    FocusScope.of(ctx).unfocus();

    final ForgotPwdFormCubit forgotPwdFormCubit =
        ctx.read<ForgotPwdFormCubit>();

    forgotPwdFormCubit.enableAutovalidate();

    final FormState? form = formKey.currentState;

    if (form == null || !form.validate()) return;

    final ForgotPwdFormState forgotPwdFormState = forgotPwdFormCubit.state;

    ctx.read<ForgetPwdCubit>().forgetPassword(email: forgotPwdFormState.email);
  }

  void changeEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void enableAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
