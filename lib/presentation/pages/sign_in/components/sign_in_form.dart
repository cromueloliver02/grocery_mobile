import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final FocusNode _passwordNode;
  final _formKey = GlobalKey<FormState>();

  void _signIn(BuildContext ctx) {
    ctx.read<SignInFormBloc>().add(SignInFormAutovalidateEnabled());

    final FormState? form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
    // sign in functionality
  }

  void _saveEmail(BuildContext ctx, String? email) {
    ctx.read<SignInFormBloc>().add(SignInFormEmailSaved(email: email));
  }

  void _savePassword(BuildContext ctx, String? password) {
    ctx.read<SignInFormBloc>().add(SignInFormPassSaved(password: password));
  }

  void _togglePassword(BuildContext ctx) {
    ctx.read<SignInFormBloc>().add(SignInFormPassToggled());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (ctx, state) => Form(
        key: _formKey,
        autovalidateMode: state.autovalidateMode,
        child: Column(
          children: [
            GCRTextFormField(
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: FunctionHandler.emailValidator,
              onSaved: (String? value) => _saveEmail(context, value),
            ),
            const SizedBox(height: 20),
            GCRTextFormField(
              focusNode: _passwordNode,
              obscureText: state.hidePassword,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              suffixIcon: GestureDetector(
                onTap: () => _togglePassword(context),
                child: Icon(
                  state.hidePassword ? Icons.visibility_off : Icons.visibility,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              validator: FunctionHandler.passwordValidator,
              onEditingComplete: () => _signIn(context),
              onSaved: (String? value) => _savePassword(context, value),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: textTheme.bodyText1!.copyWith(
                    color: Colors.lightBlue,
                    fontSize: textTheme.bodyText1!.fontSize! + 2,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: GCRButton.elevated(
                labelText: 'Sign In',
                backgroundColor: Colors.white38,
                onPressed: () => _signIn(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }
}
