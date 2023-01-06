import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import '../../../utils/utils.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatefulWidget {
  static const id = '${NavigationPage.id}/product-details';

  static Route<void> route(RouteSettings settings) {
    final Product product = settings.arguments as Product;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => ProductDetailsPage(product: product),
    );
  }

  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  void _cartItemListener(BuildContext ctx, CartItemState state) {
    if (state.formStatus == CartItemFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }

    if (state.formStatus == CartItemFormStatus.success) {
      FunctionHandler.showToast(
        'Added to cart',
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.formStatus == ViewedRecentlyFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartItemCubit>(
          create: (ctx) => CartItemCubit(
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
          BlocListener<CartItemCubit, CartItemState>(
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
