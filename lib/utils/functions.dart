import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:validators/validators.dart';

import '../data/models/models.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';
import '../presentation/widgets/widgets.dart';

void addToCart(BuildContext ctx, Product product) {
  final String userId = ctx.read<UserBloc>().state.user.id;

  ctx.read<CartActionCubit>().addToCart(
        userId: userId,
        product: product,
      );
}

void toggleWishlist(BuildContext ctx, Product product) {
  final String userId = ctx.read<UserBloc>().state.user.id;

  ctx.read<WishlistActionCubit>().toggleWishlist(
        userId: userId,
        product: product,
      );
}

void logError(Object state, GCRError error) {
  final Logger logger = Logger();

  logger.w('ERROR: $state', error);
}

Future<bool?> showWarningDialog(
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

void showErrorDialog(BuildContext ctx, GCRError err) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => GCRErrorDialog.iOS(error: err),
    );
  }

  if (Platform.isAndroid) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => GCRErrorDialog.android(error: err),
    );
  }
}

void showInfoDialog(
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

void showToast(
  String message, {
  ToastGravity gravity = ToastGravity.CENTER,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade600,
      textColor: Colors.white,
      fontSize: 16,
    );

String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name is required';
  }

  if (value.trim().length < 6) {
    return 'Name should be at least 6 characters long';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  if (!isEmail(value)) {
    return 'Invalid email address';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password should be at least 6 characters long';
  }

  return null;
}

String? shipAddressValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Shipping address is required';
  }

  if (value.trim().length < 12) {
    return 'Shipping address should be at least 12 characters long';
  }

  return null;
}
