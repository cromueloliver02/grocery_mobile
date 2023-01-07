import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatefulWidget {
  static void pushRoute(BuildContext ctx, {required Product product}) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>.value(
              value: ctx.read<CartBloc>(),
            ),
            BlocProvider<UserBloc>.value(
              value: ctx.read<UserBloc>(),
            ),
            BlocProvider<WishlistBloc>.value(
              value: ctx.read<WishlistBloc>(),
            ),
            BlocProvider<ViewedRecentlyBloc>.value(
              value: ctx.read<ViewedRecentlyBloc>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: ctx.read<NavigationCubit>(),
            ),
          ],
          child: ProductDetailsPage(product: product),
        ),
      ),
    );
  }

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  void _cartItemListener(BuildContext ctx, AddCartItemState state) {
    if (state.status == AddCartItemStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }

    if (state.status == AddCartItemStatus.success) {
      FunctionHandler.showToast(
        'Added to cart',
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.status == ViewedRecentlyFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddCartItemCubit>(
          create: (ctx) => AddCartItemCubit(
            cartRepository: ctx.read<CartRepository>(),
          ),
        ),
        BlocProvider<QtyControllerCubit>(
          create: (ctx) => QtyControllerCubit(),
          child: ProductDetailsView(product: widget.product),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddCartItemCubit, AddCartItemState>(
            listener: _cartItemListener,
          ),
          BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
            listener: _viewedRecentlyListener,
          ),
        ],
        child: ProductDetailsView(product: widget.product),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    context
        .read<ViewedRecentlyBloc>()
        .add(ViewedRecentlyItemAdded(product: widget.product));
  }
}
