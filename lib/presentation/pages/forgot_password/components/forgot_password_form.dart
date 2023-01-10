import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  void _forgetPassword(BuildContext ctx) {
    FocusScope.of(context).unfocus();

    final ForgotPwdFormBloc forgotPwdFormBloc = ctx.read<ForgotPwdFormBloc>();

    forgotPwdFormBloc.add(ForgotPwdFormAutovalidateEnabled());

    final FormState? form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    final ForgotPwdFormState forgotPwdFormState = forgotPwdFormBloc.state;

    ctx.read<ForgetPwdCubit>().forgetPassword(email: forgotPwdFormState.email);
  }

  void _onChangeEmail(BuildContext ctx, String? email) {
    ctx.read<ForgotPwdFormBloc>().add(ForgotPwdFormEmailSaved(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPwdFormBloc, ForgotPwdFormState>(
      builder: (ctx, state) => Form(
        key: _formKey,
        autovalidateMode: state.autovalidateMode,
        child: BlocBuilder<ForgetPwdCubit, ForgetPwdState>(
          builder: (ctx, state) => Column(
            children: [
              GCRTextFormField(
                hintText: 'Email Address',
                enabled: state.status != ForgetPwdStatus.loading,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: emailValidator,
                onChanged: (String? value) => _onChangeEmail(context, value),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GCRButton.elevated(
                  labelText: 'Submit',
                  loading: state.status == ForgetPwdStatus.loading,
                  backgroundColor: Colors.white38,
                  onPressed: () => _forgetPassword(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
