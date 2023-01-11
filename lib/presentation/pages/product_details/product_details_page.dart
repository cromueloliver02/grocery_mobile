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
    required AddCartItemCubit addCartItemCubit,
    required NavigationCubit navigationCubit,
  }) {
    final Product product = settings.arguments as Product;

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>.value(value: cartBloc),
          BlocProvider<UserBloc>.value(value: userBloc),
          BlocProvider<WishlistBloc>.value(value: wishlistBloc),
          BlocProvider<ViewedRecentlyBloc>.value(value: viewedRecentlyBloc),
          BlocProvider<AddCartItemCubit>.value(value: addCartItemCubit),
          BlocProvider<NavigationCubit>.value(value: navigationCubit),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<QtyControllerCubit>(
          create: (ctx) => QtyControllerCubit(),
          child: ProductDetailsView(product: widget.product),
        ),
      ],
      child: BlocListener<ViewedRecentlyBloc, ViewedRecentlyState>(
        listener: _viewedRecentlyListener,
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
