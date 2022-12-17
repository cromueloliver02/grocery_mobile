import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../utils/utils.dart';

class ViewedRecentlyPageAppBar extends StatelessWidget {
  const ViewedRecentlyPageAppBar({super.key});

  void _showClearHistoryDialog(BuildContext ctx) async {
    final bool? response = await FunctionHandler.showWarningDialog(
      ctx,
      title: 'Clear History',
      message: 'Do you wanna clear your history?',
    );

    debugPrint(response.toString());
    // clear recently viewed/hisoty functionality
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        Text(
          'History (24)',
          style: textTheme.headline3,
        ),
        IconButton(
          onPressed: () => _showClearHistoryDialog(context),
          iconSize: 30,
          icon: const Icon(IconlyBroken.delete),
        ),
      ],
    );
  }
}
