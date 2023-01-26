import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';

class ViewedRecentlyPageAppBar extends StatelessWidget {
  const ViewedRecentlyPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: BlocBuilder<ViewedRecentlyBloc, ViewedRecentlyState>(
            builder: (ctx, state) => Text(
              'History (${state.viewedItems.length})}',
              style: textTheme.headline3,
            ),
          ),
        ),
      ],
    );
  }
}
