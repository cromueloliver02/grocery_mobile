import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../utils/utils.dart';
import './components/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.formStatus == WishlistFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistBloc, WishlistState>(
      listener: _wishlistListener,
      child: const HomeView(),
    );
  }
}
