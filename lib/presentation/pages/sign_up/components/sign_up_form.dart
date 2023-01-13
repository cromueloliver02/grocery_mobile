import 'package:flutter/material.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  late final FocusNode _emailNode; // might remove all nodes in the future
  late final FocusNode _passwordNode;
  late final FocusNode _shippingNode;
  final _formKey = GlobalKey<FormState>();

  void _signUp(BuildContext ctx) {
    ctx.read<SignUpFormCubit>().signUp(ctx, formKey: _formKey);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      builder: (ctx, signupFormState) => Form(
        key: _formKey,
        autovalidateMode: signupFormState.autovalidateMode,
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, signupState) {
            final bool loading = signupState.status == SignupStatus.loading;

            return Column(
              children: [
                GCRTextFormField(
                  hintText: 'Full name',
                  enabled: !loading,
                  textInputAction: TextInputAction.next,
                  validator: nameValidator,
                  onChanged: ctx.read<SignUpFormCubit>().changeName,
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _emailNode,
                  hintText: 'Email Address',
                  enabled: !loading,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                  onChanged: ctx.read<SignUpFormCubit>().changeEmail,
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _passwordNode,
                  obscureText: signupFormState.hidePassword,
                  hintText: 'Password',
                  enabled: !loading,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: ctx.read<SignUpFormCubit>().togglePasswordVisibility,
                    child: Icon(
                      signupFormState.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  validator: passwordValidator,
                  onChanged: ctx.read<SignUpFormCubit>().changePassword,
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _shippingNode,
                  hintText: 'Shipping Address',
                  enabled: !loading,
                  textInputAction: TextInputAction.done,
                  validator: shipAddressValidator,
                  onEditingComplete: () => _signUp(context),
                  onChanged: ctx.read<SignUpFormCubit>().changeShipAddress,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: GCRButton.elevated(
                    labelText: 'Sign Up',
                    loading: loading,
                    backgroundColor: Colors.white38,
                    onPressed: () => _signUp(context),
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
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _shippingNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    _shippingNode.dispose();
    super.dispose();
  }
}
