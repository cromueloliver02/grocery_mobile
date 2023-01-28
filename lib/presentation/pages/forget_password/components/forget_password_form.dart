import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPwdFormCubit, ForgetPwdFormState>(
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
                onChanged: ctx.read<ForgetPwdFormCubit>().changeEmail,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GCRButton.elevated(
                  labelText: 'Submit',
                  loading: state.status == ForgetPwdStatus.loading,
                  backgroundColor: Colors.white38,
                  onPressed: () => ctx
                      .read<ForgetPwdFormCubit>()
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
