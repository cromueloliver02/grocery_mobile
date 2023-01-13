import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPwdFormCubit, ForgotPwdFormState>(
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
                onChanged: ctx.read<ForgotPwdFormCubit>().changeEmail,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GCRButton.elevated(
                  labelText: 'Submit',
                  loading: state.status == ForgetPwdStatus.loading,
                  backgroundColor: Colors.white38,
                  onPressed: () => ctx
                      .read<ForgotPwdFormCubit>()
                      .forgetPassword(ctx, formKey: _formKey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
