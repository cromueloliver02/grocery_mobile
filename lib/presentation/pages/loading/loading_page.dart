import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../data/models/models.dart';
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
  void _initializeApp(BuildContext ctx, AppState state) {
    final ProductListBloc productListBloc = ctx.read<ProductListBloc>();
    final ProductsOnSaleBloc productsOnSaleBloc =
        ctx.read<ProductsOnSaleBloc>();
    final CartBloc cartBloc = ctx.read<CartBloc>();

    final List<Product> onSaleProducts =
        state.productList.where((d) => d.isOnSale).toList();

    productListBloc.add(ProductListLoaded(productList: state.productList));
    productsOnSaleBloc.add(
      ProductsOnSaleLoaded(onSaleProducts: onSaleProducts),
    );
    cartBloc.add(CartLoaded(cart: state.cart));
  }

  void _appListener(BuildContext ctx, AppState state) {
    if (state.status == AppStatus.success) {
      _initializeApp(ctx, state);

      Navigator.pushReplacementNamed(ctx, NavigationPage.id);
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
}
