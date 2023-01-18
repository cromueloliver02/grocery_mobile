import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../pages.dart';
import '../../../utils/utils.dart';
import './components/loading_view.dart';

class LoadingPage extends StatefulWidget {
  static const id = '/loading';

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const LoadingPage(),
    );
  }

  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void _initializeApp(BuildContext ctx, LoadingState state) {
    final ProductListBloc productListBloc = ctx.read<ProductListBloc>();
    final ProductsOnSaleBloc productsOnSaleBloc =
        ctx.read<ProductsOnSaleBloc>();
    final CartBloc cartBloc = ctx.read<CartBloc>();
    final UserBloc userBloc = ctx.read<UserBloc>();

    final List<Product> onSaleProducts =
        state.productList.where((d) => d.isOnSale).toList();

    productListBloc.add(ProductListLoaded(productList: state.productList));
    productsOnSaleBloc.add(
      ProductsOnSaleLoaded(onSaleProducts: onSaleProducts),
    );
    cartBloc.add(CartLoaded(cart: state.cart));
    userBloc.add(UserLoaded(user: state.user));
  }

  void _appListener(BuildContext ctx, LoadingState state) {
    if (state.status == AppStatus.success) {
      _initializeApp(ctx, state);

      Navigator.pushNamed(ctx, NavigationPage.id);
    }

    if (state.status == AppStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoadingBloc, LoadingState>(
      listener: _appListener,
      child: const LoadingView(),
    );
  }

  @override
  void initState() {
    super.initState();

    final String userId = context.read<AuthBloc>().state.user!.uid;

    // start initialiazing app/fetch initial data
    context.read<LoadingBloc>().add(LoadingStarted(userId: userId));
  }

  @override
  void deactivate() {
    // reset loading-page-level states
    context.read<LoadingBloc>().add(LoadingResetRequested());
    context.read<ProductListBloc>().add(ProductListResetRequested());
    context.read<ProductsOnSaleBloc>().add(ProductsOnSaleResetRequested());
    context.read<CartBloc>().add(CartResetRequested());
    context.read<UserBloc>().add(UserResetRequested());
    super.deactivate();
  }
}
