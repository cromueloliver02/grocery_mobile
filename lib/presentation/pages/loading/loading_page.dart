import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../pages.dart';
import '../../../utils/utils.dart';
import './components/loading_view.dart';

class LoadingPage extends StatefulWidget {
  static const id = '/loading';

  static Route<void> route(
    RouteSettings settings, {
    required AppBloc appBloc,
    required ProductListBloc productListBloc,
    required ProductsOnSaleBloc productsOnSaleBloc,
    required CartBloc cartBloc,
    required UserBloc userBloc,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>.value(value: appBloc),
          BlocProvider<ProductListBloc>.value(value: productListBloc),
          BlocProvider<ProductsOnSaleBloc>.value(value: productsOnSaleBloc),
          BlocProvider<CartBloc>.value(value: cartBloc),
          BlocProvider<UserBloc>.value(value: userBloc),
        ],
        child: const LoadingPage(),
      ),
    );
  }

  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void _initializeApp(BuildContext ctx, AppState state) {
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

  void _appListener(BuildContext ctx, AppState state) {
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
    return BlocListener<AppBloc, AppState>(
      listener: _appListener,
      child: const LoadingView(),
    );
  }

  @override
  void initState() {
    super.initState();

    final String userId = context.read<AuthBloc>().state.user!.uid;

    context.read<AppBloc>().add(AppStarted(userId: userId));
  }

  @override
  void deactivate() {
    // reset loading-page-level states
    context.read<AppBloc>().add(AppResetRequested());
    context.read<ProductListBloc>().add(ProductListResetRequested());
    context.read<ProductsOnSaleBloc>().add(ProductsOnSaleResetRequested());
    context.read<CartBloc>().add(CartResetRequested());
    context.read<UserBloc>().add(UserResetRequested());
    super.deactivate();
  }
}
