import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';

class AddressDialog extends StatefulWidget {
  const AddressDialog({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  late final TextEditingController _addressController;

  void _updateShipAddress(BuildContext ctx) {
    final String userId = ctx.read<UserBloc>().state.user.id;

    ctx.read<UserActionCubit>().updateShipAddress(
          userId: userId,
          newShipAddress: _addressController.text,
        );

    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        'Update Address',
        style: textTheme.headlineMedium,
      ),
      content: TextField(
        controller: _addressController,
        maxLines: 5,
        decoration: const InputDecoration(
          hintText: 'Enter your address',
        ),
      ),
      actions: [
        GCRButton.text(
          labelText: 'Cancel',
          foregroundColor: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
        GCRButton.text(
          labelText: 'Save',
          onPressed: () => _updateShipAddress(context),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
}
