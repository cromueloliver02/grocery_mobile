import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../widgets/widgets.dart';

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

  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 6) {
      return 'Name should be at least 6 characters long';
    }

    return null;
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
      return 'Password should be at least 6 characters long';
    }

    return null;
  }

  static String? shipAddressValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Shipping address is required';
    }

    if (value.trim().length < 12) {
      return 'Shipping address should be at least 12 characters long';
    }

    return null;
  }
}
