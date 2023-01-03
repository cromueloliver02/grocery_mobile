import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import './components/user_view.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return const UserView();
  }

  @override
  void initState() {
    super.initState();

    final String id = context.read<AuthBloc>().state.user!.uid;

    context.read<UserBloc>().add(UserStarted(id: id));
  }
}
