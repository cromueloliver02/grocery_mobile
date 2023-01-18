import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/user_view.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  void _userActionListener(
    BuildContext ctx,
    UserActionState state,
  ) {
    if (state.status == UserActionStatus.success) {
      showToast(
        'Successfully updated',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == UserActionStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserActionCubit, UserActionState>(
      listener: _userActionListener,
      child: const UserView(),
    );
  }
}
