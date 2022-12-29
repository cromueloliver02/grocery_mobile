import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../pages.dart';
import '../../utils/utils.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatelessWidget {
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

  void _cartListener(BuildContext ctx, CartState state) {
    if (state.formStatus == CartFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: _cartListener,
      child: BlocProvider<QtyControllerCubit>(
        create: (ctx) => QtyControllerCubit(),
        child: ProductDetailsView(product: product),
      ),
    );
  }
}
