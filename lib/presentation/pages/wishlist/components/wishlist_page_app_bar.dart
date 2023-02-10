import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../../utils/utils.dart';

class WishlistPageAppBar extends StatelessWidget {
  const WishlistPageAppBar({super.key});

  void _showClearWishlistDialog(BuildContext ctx) async {
    final UserBloc userBloc = ctx.read<UserBloc>();
    final WishlistActionCubit wishlistActionCubit =
        ctx.read<WishlistActionCubit>();

    final bool? response = await showWarningDialog(
      ctx,
      title: 'Clear Wishlist',
      message: 'Do you wanna clear your wishlist?',
    );

    if (response != null && response) {
      final String userId = userBloc.state.user.id;

      wishlistActionCubit.clearWishlist(userId);
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
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (ctx, state) => Text(
            'Wishlist (${state.wishlist.wishlistItems.length})',
            style: textTheme.displaySmall,
          ),
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
