import 'package:flutter/material.dart';

class OrderDetailsPageAppBar extends StatelessWidget {
  const OrderDetailsPageAppBar({
    super.key,
    required this.orderedItemCount,
  });

  final int orderedItemCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        'Ordered Items ($orderedItemCount)',
        style: textTheme.headline3,
      ),
    );
  }
}
