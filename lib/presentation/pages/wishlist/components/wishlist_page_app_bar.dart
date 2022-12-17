import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../utils/utils.dart';

class WishlistPageAppBar extends StatelessWidget {
  const WishlistPageAppBar({super.key});

  void _showClearWishlistDialog(BuildContext ctx) async {
    final bool? response = await FunctionHandler.showWarningDialog(
      ctx,
      title: 'Clear Wishlist',
      message: 'Do you wanna clear your wishlist?',
    );

    debugPrint(response.toString());
    // clear wishlist functionality
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
          'Wishlist (13)',
          style: textTheme.headline3,
        ),
        IconButton(
          onPressed: () => _showClearWishlistDialog(context),
          iconSize: 30,
          icon: const Icon(IconlyBroken.delete),
        ),
      ],
    );
  }
}
