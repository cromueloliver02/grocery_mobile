import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String id = '/product-details';

  static Route<void> route(RouteSettings settings) {
    final Product product = settings.arguments as Product;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => BlocProvider<QtyControllerCubit>(
        create: (ctx) => QtyControllerCubit(),
        child: ProductDetailsPage(product: product),
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
  void _viewedRecentlyActionListener(
    BuildContext ctx,
    ViewedRecentlyActionState state,
  ) {
    if (state.status == ViewedRecentlyActionStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewedRecentlyActionCubit, ViewedRecentlyActionState>(
      listener: _viewedRecentlyActionListener,
      child: ProductDetailsView(product: widget.product),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<ViewedRecentlyActionCubit>().addItem(widget.product);
  }
}
