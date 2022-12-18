import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  void _forgetPassword(BuildContext ctx) {
    ctx.read<ForgotPwdFormBloc>().add(ForgotPwdFormAutovalidateEnabled());

    final FormState? form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
    // forget password functionality
  }

  void _saveEmail(BuildContext ctx, String? email) {
    ctx.read<ForgotPwdFormBloc>().add(ForgotPwdFormEmailSaved(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPwdFormBloc, ForgotPwdFormState>(
      builder: (ctx, state) => Form(
        key: _formKey,
        autovalidateMode: state.autovalidateMode,
        child: Column(
          children: [
            GCRTextFormField(
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: FunctionHandler.emailValidator,
              onSaved: (String? value) => _saveEmail(context, value),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: GCRButton.elevated(
                labelText: 'Submit',
                backgroundColor: Colors.white38,
                onPressed: () => _forgetPassword(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
