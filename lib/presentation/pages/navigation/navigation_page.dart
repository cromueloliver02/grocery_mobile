import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/navigation_view.dart';

class NavigationPage extends StatefulWidget {
  static const id = '/navigation';

  static Route<void> route(
    RouteSettings settings, {
    required ProductListBloc productListBloc,
    required ProductsOnSaleBloc productsOnSaleBloc,
    required CartBloc cartBloc,
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
    required ViewedRecentlyBloc viewedRecentlyBloc,
    required AddCartItemCubit addCartItemCubit,
    required RemoveCartItemCubit removeCartItemCubit,
    required IncrementCartItemCubit incrementCartItemCubit,
    required DecrementCartItemCubit decrementCartItemCubit,
    required UpdateCartItemQtyCubit updateCartItemQtyCubit,
    required ClearCartCubit clearCartCubit,
    required NavigationCubit navigationCubit,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductListBloc>.value(value: productListBloc),
          BlocProvider<ProductsOnSaleBloc>.value(value: productsOnSaleBloc),
          BlocProvider<CartBloc>.value(value: cartBloc),
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<AddCartItemCubit>.value(value: addCartItemCubit),
          BlocProvider<RemoveCartItemCubit>.value(value: removeCartItemCubit),
          BlocProvider<IncrementCartItemCubit>.value(
            value: incrementCartItemCubit,
          ),
          BlocProvider<DecrementCartItemCubit>.value(
            value: decrementCartItemCubit,
          ),
          BlocProvider<UpdateCartItemQtyCubit>.value(
            value: updateCartItemQtyCubit,
          ),
          BlocProvider<ClearCartCubit>.value(value: clearCartCubit),
          BlocProvider<NavigationCubit>.value(value: navigationCubit),
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

  void _removeCartItemListener(BuildContext ctx, RemoveCartItemState state) {
    if (state.status == RemoveCartItemStatus.success) {
      ctx.read<CartBloc>().add(CartItemRemoved(cartItemId: state.cartItemId));

      showToast(
        'Removed from cart',
        gravity: ToastGravity.BOTTOM,
      );
    }

    if (state.status == RemoveCartItemStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _incrementCartItemListener(
    BuildContext ctx,
    IncrementCartItemState state,
  ) {
    if (state.status == IncrementCartItemStatus.success) {
      ctx
          .read<CartBloc>()
          .add(CartItemIncremented(cartItemId: state.cartItemId));
    }

    if (state.status == IncrementCartItemStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _decrementCartItemListener(
    BuildContext ctx,
    DecrementCartItemState state,
  ) {
    if (state.status == DecrementCartItemStatus.success) {
      ctx
          .read<CartBloc>()
          .add(CartItemDecremented(cartItemId: state.cartItemId));
    }

    if (state.status == DecrementCartItemStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _updateCartItemQtyCubitListener(
    BuildContext ctx,
    UpdateCartItemQtyState state,
  ) {
    if (state.status == UpdateCartItemQtyStatus.success) {
      ctx.read<CartBloc>().add(CartItemQtyUpdated(
            cartItemId: state.cartItemId,
            newQuantity: state.newQuantity,
          ));
    }

    if (state.status == UpdateCartItemQtyStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _clearCartListener(
    BuildContext ctx,
    ClearCartState state,
  ) {
    if (state.status == ClearCartStatus.success) {
      ctx.read<CartBloc>().add(CartCleared());
    }

    if (state.status == ClearCartStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddCartItemCubit, AddCartItemState>(
          listener: _addCartItemListener,
        ),
        BlocListener<RemoveCartItemCubit, RemoveCartItemState>(
          listener: _removeCartItemListener,
        ),
        BlocListener<IncrementCartItemCubit, IncrementCartItemState>(
          listener: _incrementCartItemListener,
        ),
        BlocListener<DecrementCartItemCubit, DecrementCartItemState>(
          listener: _decrementCartItemListener,
        ),
        BlocListener<UpdateCartItemQtyCubit, UpdateCartItemQtyState>(
          listener: _updateCartItemQtyCubitListener,
        ),
        BlocListener<ClearCartCubit, ClearCartState>(
          listener: _clearCartListener,
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
    context.read<AddCartItemCubit>().reset();
    context.read<RemoveCartItemCubit>().reset();
    context.read<IncrementCartItemCubit>().reset();
    context.read<DecrementCartItemCubit>().reset();
    context.read<ClearCartCubit>().reset();
    context.read<NavigationCubit>().reset();

    super.deactivate();
  }
}
