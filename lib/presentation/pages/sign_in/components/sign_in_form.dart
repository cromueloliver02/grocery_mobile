import 'package:flutter/material.dart';

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
    ctx.read<SignInFormCubit>().signIn(ctx, formKey: _formKey);
  }

  void _goToForgetPasswordPage(BuildContext ctx) {
    Navigator.pushNamed(ctx, ForgotPasswordPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SignInFormCubit, SignInFormState>(
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
                  validator: emailValidator,
                  onChanged: ctx.read<SignInFormCubit>().changeEmail,
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
                    onTap: loading
                        ? null
                        : ctx.read<SignInFormCubit>().togglePassword,
                    child: Icon(
                      signInFormState.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  validator: passwordValidator,
                  onEditingComplete: () => _signIn(context),
                  onChanged: ctx.read<SignInFormCubit>().changePassword,
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
