import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';
import './components/user_view.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  void _userListener(BuildContext ctx, UserState state) {
    if (state.status == UserStatus.failure ||
        state.formStatus == UserFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: _userListener,
      child: const UserView(),
    );
  }

  @override
  void initState() {
    super.initState();

    final String id = context.read<AuthBloc>().state.user!.uid;

    context.read<UserBloc>().add(UserStarted(id: id));
  }
}
