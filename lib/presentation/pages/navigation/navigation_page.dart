import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatefulWidget {
  static const id = '/navigation';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<UpdateShipAddressCubit>(
        create: (ctx) => UpdateShipAddressCubit(
          userBloc: ctx.read<UserBloc>(),
          userRepository: ctx.read<UserRepository>(),
        ),
        child: const NavigationPage(),
      ),
    );
  }

  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.status == WishlistStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.status == ViewedRecentlyStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _cartActionListener(BuildContext ctx, CartActionState state) {
    if (state.status == CartActionStatus.success &&
        state.actionType == CartActionType.addToCart) {
      showToast(
        'Added to cart',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == CartActionStatus.success &&
        state.actionType == CartActionType.removeFromCart) {
      showToast(
        'Removed from cart',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == CartActionStatus.success &&
        state.actionType == CartActionType.clearCart) {
      showToast(
        'Cart cleared',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == CartActionStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _wishlistActionListener(BuildContext ctx, WishlistActionState state) {
    // TODO: apply toast message when successfully added to wishlist
    // TODO: apply toast message when successfully removed from wishlist

    if (state.status == WishlistActionStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WishlistBloc, WishlistState>(
          listener: _wishlistListener,
        ),
        BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
          listener: _viewedRecentlyListener,
        ),
        BlocListener<CartActionCubit, CartActionState>(
          listener: _cartActionListener,
        ),
        BlocListener<WishlistActionCubit, WishlistActionState>(
          listener: _wishlistActionListener,
        ),
      ],
      child: NavigationView(),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<WishlistBloc>().add(WishlistStarted());
    context.read<ViewedRecentlyBloc>().add(ViewedRecentlyStarted());
  }

  @override
  void deactivate() {
    // reset navigation-page-level states
    context.read<WishlistBloc>().add(WishlistResetRequested());
    context.read<ViewedRecentlyBloc>().add(ViewedRecentlyResetRequested());
    context.read<CartActionCubit>().reset();
    // TODO: create reset method for wishlist action cubit
    // context.read<WishlistActionCubit>().reset();
    context.read<NavigationCubit>().reset();

    super.deactivate();
  }
}
