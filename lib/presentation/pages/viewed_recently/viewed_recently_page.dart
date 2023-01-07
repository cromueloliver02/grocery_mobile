import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/viewed_recently_view.dart';

class ViewedRecentlyPage extends StatelessWidget {
  static void pushRoute(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>.value(
              value: ctx.read<UserBloc>(),
            ),
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
            BlocProvider<AddCartItemCubit>.value(
              value: ctx.read<AddCartItemCubit>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: ctx.read<NavigationCubit>(),
            ),
          ],
          child: const ViewedRecentlyPage(),
        ),
      ),
    );
  }

  const ViewedRecentlyPage({super.key});

  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.status == ViewedRecentlyStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
      listener: _viewedRecentlyListener,
      child: const ViewedRecentlyView(),
    );
  }
}
