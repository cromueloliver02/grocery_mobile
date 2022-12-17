import 'package:flutter/material.dart';

class OrdersPageAppBar extends StatelessWidget {
  const OrdersPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        'Your Orders (2)',
        style: textTheme.headline3,
      ),
    );
  }
}
