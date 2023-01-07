import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';
import './components/wishlist_view.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.status == WishlistStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistBloc, WishlistState>(
      listener: _wishlistListener,
      child: const WishlistView(),
    );
  }
}
