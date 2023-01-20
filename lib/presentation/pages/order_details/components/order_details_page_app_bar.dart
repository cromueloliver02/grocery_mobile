import 'package:flutter/material.dart';

class OrderDetailsPageAppBar extends StatelessWidget {
  const OrderDetailsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        'Ordered Items (4)',
        style: textTheme.headline3,
      ),
    );
  }
}
