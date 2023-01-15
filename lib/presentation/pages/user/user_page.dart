import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/user_view.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  void _updateShipAddressListener(
    BuildContext ctx,
    UpdateShipAddressState state,
  ) {
    if (state.status == UpdateShipAddressStatus.success) {
      showToast(
        'Successfully updated',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == UpdateShipAddressStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateShipAddressCubit, UpdateShipAddressState>(
      listener: _updateShipAddressListener,
      child: const UserView(),
    );
  }
}
