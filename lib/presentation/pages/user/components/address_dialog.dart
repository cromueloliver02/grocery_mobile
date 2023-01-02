import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        'Update Address',
        style: textTheme.headline4,
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
          onPressed: () {},
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
