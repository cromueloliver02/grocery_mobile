import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
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
    final SignUpFormBloc signUpFormBloc = ctx.read<SignUpFormBloc>();

    signUpFormBloc.add(SignUpFormAutovalidateEnabled());

    final FormState? form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    final SignUpFormState signupFormState = signUpFormBloc.state;

    ctx.read<SignUpCubit>().signupWithEmail(
          name: signupFormState.name,
          email: signupFormState.email,
          password: signupFormState.password,
          shipAddress: signupFormState.shipAddress,
        );
  }

  void _onChangeName(BuildContext ctx, String? name) {
    ctx.read<SignUpFormBloc>().add(SignUpFormNameChanged(name: name));
  }

  void _onChangeEmail(BuildContext ctx, String? email) {
    ctx.read<SignUpFormBloc>().add(SignUpFormEmailChanged(email: email));
  }

  void _onChangePassword(BuildContext ctx, String? password) {
    ctx.read<SignUpFormBloc>().add(SignUpFormPassChanged(password: password));
  }

  void _onChangeShipAddress(BuildContext ctx, String? shipAddress) {
    ctx
        .read<SignUpFormBloc>()
        .add(SignUpFormShipAddressChanged(shipAddress: shipAddress));
  }

  void _togglePasswordHandler(BuildContext ctx) {
    ctx.read<SignUpFormBloc>().add(SignUpFormPassToggled());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
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
                  validator: FunctionHandler.nameValidator,
                  onChanged: (String? value) => _onChangeName(context, value),
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _emailNode,
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
                  obscureText: signupFormState.hidePassword,
                  hintText: 'Password',
                  enabled: !loading,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: () => _togglePasswordHandler(context),
                    child: Icon(
                      signupFormState.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  validator: FunctionHandler.passwordValidator,
                  onChanged: (String? value) =>
                      _onChangePassword(context, value),
                ),
                const SizedBox(height: 20),
                GCRTextFormField(
                  focusNode: _shippingNode,
                  hintText: 'Shipping Address',
                  enabled: !loading,
                  textInputAction: TextInputAction.done,
                  validator: FunctionHandler.shipAddressValidator,
                  onEditingComplete: () => _signUp(context),
                  onChanged: (String? value) =>
                      _onChangeShipAddress(context, value),
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
