import 'package:flutter/material.dart';

import '../widgets/grc_warning_dialog_dialog.dart';

class FunctionHandler {
  static Future<bool?> showWarningDialog(
    BuildContext ctx, {
    required String title,
    required String message,
  }) {
    return showDialog<bool>(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => GCRWarningDialog(
        title: title,
        message: message,
      ),
    );
  }
}
