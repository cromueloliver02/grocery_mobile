import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatefulWidget {
  static const id = '/navigation';

  static Route<void> route(
    RouteSettings settings, {
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
        ],
        child: const NavigationPage(),
      ),
    );
  }

  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
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

  @override
  void initState() {
    super.initState();

    context
        .read<UserBloc>()
        .add(UserStarted(userId: context.read<AuthBloc>().state.user!.uid));
    context.read<WishlistBloc>().add(WishlistStarted());
  }
}
