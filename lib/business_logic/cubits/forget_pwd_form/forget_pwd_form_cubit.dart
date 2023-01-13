import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

import '../cubits.dart';

part 'forget_pwd_form_state.dart';

class ForgetPwdFormCubit extends Cubit<ForgetPwdFormState> {
  ForgetPwdFormCubit() : super(ForgetPwdFormState.initial());

  void forgetPassword(
    BuildContext ctx, {
    required GlobalKey<FormState> formKey,
  }) {
    FocusScope.of(ctx).unfocus();

    final ForgetPwdFormCubit forgetPwdFormCubit =
        ctx.read<ForgetPwdFormCubit>();

    forgetPwdFormCubit.enableAutovalidate();

    final FormState? form = formKey.currentState;

    if (form == null || !form.validate()) return;

    final ForgetPwdFormState forgetPwdFormState = forgetPwdFormCubit.state;

    ctx.read<ForgetPwdCubit>().forgetPassword(email: forgetPwdFormState.email);
  }

  void changeEmail(String? email) {
    emit(state.copyWith(email: () => email ?? state.email));
  }

  void enableAutovalidate() {
    emit(state.copyWith(autovalidateMode: () => AutovalidateMode.always));
  }
}
