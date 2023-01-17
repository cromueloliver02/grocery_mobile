import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../utils/utils.dart';
import './components/product_details_view.dart';

class ProductDetailsPage extends StatefulWidget {
  static const id = '/product-details';

  static Route<void> route(
    RouteSettings settings, {
    required CartBloc cartBloc,
    required UserBloc userBloc,
    required WishlistBloc wishlistBloc,
    required ViewedRecentlyBloc viewedRecentlyBloc,
    required CartActionCubit cartActionCubit,
    required WishlistActionCubit wishlistActionCubit,
    required NavigationCubit navigationCubit,
  }) {
    final Product product = settings.arguments as Product;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<CartActionCubit>.value(value: cartActionCubit),
          BlocProvider<WishlistActionCubit>.value(value: wishlistActionCubit),
          BlocProvider<QtyControllerCubit>(
            create: (ctx) => QtyControllerCubit(),
            child: ProductDetailsView(product: product),
          ),
        ],
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
  void _viewedRecentlyListener(BuildContext ctx, ViewedRecentlyState state) {
    if (state.status == ViewedRecentlyFormStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
      listener: _viewedRecentlyListener,
      child: ProductDetailsView(product: widget.product),
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
