import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:validators/validators.dart';

import '../data/models/models.dart';
import '../presentation/widgets/widgets.dart';

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

  static void showErrorDialog(BuildContext ctx, GCRError err) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: ctx,
        builder: (ctx) => GCRErrorDialog.iOS(error: err),
      );
    }

    if (Platform.isAndroid) {
      showDialog(
        context: ctx,
        builder: (ctx) => GCRErrorDialog.android(error: err),
      );
    }
  }

  static void showInfoDialog(
    BuildContext ctx, {
    required String title,
    required String message,
    String okText = 'Ok',
  }) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => GCRInfoDialog(
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
