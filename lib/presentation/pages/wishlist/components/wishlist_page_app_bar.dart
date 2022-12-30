import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';

class WishlistPageAppBar extends StatelessWidget {
  const WishlistPageAppBar({super.key});

  void _showClearWishlistDialog(BuildContext ctx) async {
    final WishlistBloc wishlistBloc = ctx.read<WishlistBloc>();

    final bool? response = await FunctionHandler.showWarningDialog(
      ctx,
      title: 'Clear Wishlist',
      message: 'Do you wanna clear your wishlist?',
    );

    if (response != null && response) {
      wishlistBloc.add(WishlistCleared());
    }
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
