import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

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

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!isEmail(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }

    return null;
  }
}
