import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatelessWidget {
  static const id = '/navigation';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const NavigationPage(),
    );
  }

  const NavigationPage({super.key});

  void _addCartItemListener(BuildContext ctx, AddCartItemState state) {
    if (state.status == AddCartItemStatus.success) {
      ctx.read<CartBloc>().add(CartItemAdded(cartItem: state.cartItem));

      showToast(
        'Added to cart',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == AddCartItemStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (ctx) => UserBloc(
            userRepository: ctx.read<UserRepository>(),
          )..add(UserStarted(userId: ctx.read<AuthBloc>().state.user!.uid)),
        ),
        BlocProvider<WishlistBloc>(
          create: (ctx) => WishlistBloc()..add(WishlistStarted()),
        ),
        BlocProvider<ViewedRecentlyBloc>(
          create: (ctx) => ViewedRecentlyBloc()..add(ViewedRecentlyStarted()),
        ),
        BlocProvider<AddCartItemCubit>(
          create: (ctx) => AddCartItemCubit(
            cartRepository: ctx.read<CartRepository>(),
          ),
        ),
        BlocProvider<NavigationCubit>(
          create: (ctx) => NavigationCubit(),
        ),
      ],
      child: BlocListener<AddCartItemCubit, AddCartItemState>(
        listener: _addCartItemListener,
        child: NavigationView(),
      ),
    );
  }
}
