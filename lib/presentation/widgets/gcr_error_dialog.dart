import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

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
        style: textTheme.displaySmall,
      ),
      content: Text(
        error.message,
        style: textTheme.bodyLarge,
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
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      icon: const Icon(
        Icons.error,
        size: 30,
      ),
      title: Text(
        error.code,
        textAlign: TextAlign.center,
        style: textTheme.displaySmall,
      ),
      content: Text(
        error.message,
        textAlign: TextAlign.center,
        style: textTheme.bodyLarge,
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ),
      ],
    );
  }
}
