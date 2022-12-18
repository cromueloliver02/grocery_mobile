import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

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
    ctx.read<SignUpFormBloc>().add(SignUpFormAutovalidateEnabled());

    final FormState? form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
    // sign up functionality
  }

  void _saveName(BuildContext ctx, String? name) {
    ctx.read<SignUpFormBloc>().add(SignUpFormNameSaved(name: name));
  }

  void _saveEmail(BuildContext ctx, String? email) {
    ctx.read<SignUpFormBloc>().add(SignUpFormEmailSaved(email: email));
  }

  void _savePassword(BuildContext ctx, String? password) {
    ctx.read<SignUpFormBloc>().add(SignUpFormPassSaved(password: password));
  }

  void _saveShipAddress(BuildContext ctx, String? shipAddress) {
    ctx
        .read<SignUpFormBloc>()
        .add(SignUpFormShipAddressSaved(shipAddress: shipAddress));
  }

  void _togglePasswordHandler(BuildContext ctx) {
    ctx.read<SignUpFormBloc>().add(SignUpFormPassToggled());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (ctx, state) => Form(
        key: _formKey,
        autovalidateMode: state.autovalidateMode,
        child: Column(
          children: [
            GCRTextFormField(
              hintText: 'Full name',
              textInputAction: TextInputAction.next,
              validator: FunctionHandler.nameValidator,
              onSaved: (String? value) => _saveName(context, value),
            ),
            const SizedBox(height: 20),
            GCRTextFormField(
              focusNode: _emailNode,
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
              textInputAction: TextInputAction.next,
              suffixIcon: GestureDetector(
                onTap: () => _togglePasswordHandler(context),
                child: Icon(
                  state.hidePassword ? Icons.visibility_off : Icons.visibility,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              validator: FunctionHandler.passwordValidator,
              onSaved: (String? value) => _savePassword(context, value),
            ),
            const SizedBox(height: 20),
            GCRTextFormField(
              focusNode: _shippingNode,
              hintText: 'Shipping Address',
              textInputAction: TextInputAction.done,
              validator: FunctionHandler.shipAddressValidator,
              onEditingComplete: () => _signUp(context),
              onSaved: (String? value) => _saveShipAddress(context, value),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: GCRButton.elevated(
                labelText: 'Sign Up',
                backgroundColor: Colors.white38,
                onPressed: () => _signUp(context),
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
