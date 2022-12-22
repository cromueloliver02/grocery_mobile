import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/models.dart';
import '../utils/utils.dart';

class GCRErrorDialog extends StatelessWidget {
  const GCRErrorDialog.iOS({
    super.key,
    required this.error,
    this.platform = GCRPlatform.iOs,
  });

  const GCRErrorDialog.android({
    super.key,
    required this.error,
    this.platform = GCRPlatform.android,
  });

  final GCRError error;
  final GCRPlatform platform;

  @override
  Widget build(BuildContext context) {
    if (platform == GCRPlatform.iOs) {
      return _ErrorDialogIOS(error: error);
    }

    if (platform == GCRPlatform.android) {
      return _ErrorDialogAndroid(error: error);
    }

    return const SizedBox.shrink();
  }
}

class _ErrorDialogIOS extends StatelessWidget {
  const _ErrorDialogIOS({
    Key? key,
    required this.error,
  }) : super(key: key);

  final GCRError error;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CupertinoAlertDialog(
      title: Text(
        error.code,
        style: textTheme.headline3,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error.plugin, style: textTheme.bodyText1),
          const SizedBox(height: 10),
          Text(error.message, style: textTheme.bodyText1),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class _ErrorDialogAndroid extends StatelessWidget {
  const _ErrorDialogAndroid({
    Key? key,
    required this.error,
  }) : super(key: key);

  final GCRError error;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        error.code,
        style: textTheme.headline3,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(error.plugin, style: textTheme.bodyText1),
          const SizedBox(height: 10),
          Text(error.message, style: textTheme.bodyText1),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
