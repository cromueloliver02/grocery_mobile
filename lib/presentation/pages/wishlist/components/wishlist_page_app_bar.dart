import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WishlistPageAppBar extends StatelessWidget {
  const WishlistPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back),
        Text(
          'Wishlist (13)',
          style: textTheme.headline3,
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(IconlyBroken.delete),
        ),
      ],
    );
  }
}
