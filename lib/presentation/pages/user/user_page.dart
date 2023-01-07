import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
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
    return BlocProvider<UserBloc>(
      create: (ctx) {
        final String userId = context.read<AuthBloc>().state.user!.uid;

        return UserBloc(
          userRepository: ctx.read<UserRepository>(),
        )..add(UserStarted(userId: userId));
      },
      child: const UserView(),
    );
  }
}
