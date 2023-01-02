import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';
import '../../../../utils/utils.dart';

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

    final SignInFormState signInFormState = ctx.read<SignInFormBloc>().state;

    ctx.read<SignInCubit>().signinWithEmail(
          email: signInFormState.email,
          password: signInFormState.password,
        );
  }

  void _onChangeEmail(BuildContext ctx, String? email) {
    ctx.read<SignInFormBloc>().add(SignInFormEmailSaved(email: email));
  }

  void _onChangePassword(BuildContext ctx, String? password) {
    ctx.read<SignInFormBloc>().add(SignInFormPassSaved(password: password));
  }

  void _togglePassword(BuildContext ctx) {
    ctx.read<SignInFormBloc>().add(SignInFormPassToggled());
  }

  void _goToForgetPasswordPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ForgotPasswordPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (ctx, signInFormState) => Form(
        key: _formKey,
        autovalidateMode: signInFormState.autovalidateMode,
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (ctx, signinState) {
            final bool loading = signinState.status == SigninStatus.loading;

            return Column(
              children: [
                GCRTextFormField(
                  hintText: 'Email Address',
                  enabled: !loading,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: FunctionHandler.emailValidator,
                  onChanged: (String? value) => _onChangeEmail(context, value),
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _passwordNode,
                  obscureText: signInFormState.hidePassword,
                  hintText: 'Password',
                  enabled: !loading,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: GestureDetector(
                    onTap: loading ? null : () => _togglePassword(context),
                    child: Icon(
                      signInFormState.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  validator: FunctionHandler.passwordValidator,
                  onEditingComplete: () => _signIn(context),
                  onChanged: (String? value) =>
                      _onChangePassword(context, value),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed:
                        loading ? null : () => _goToForgetPasswordPage(context),
                    child: Text(
                      'Forgot Password?',
                      style: textTheme.bodyText1!.copyWith(
                        color: loading ? Colors.grey : Colors.lightBlue,
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
                    loading: loading,
                    backgroundColor: Colors.white38,
                    onPressed: () => _signIn(context),
                  ),
                ),
              ],
            );
          },
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
