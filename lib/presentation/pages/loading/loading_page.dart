import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../business_logic/blocs/blocs.dart';
import '../../../presentation/pages/pages.dart';
import '../../../utils/utils.dart';
import './components/loading_view.dart';

class LoadingPage extends StatefulWidget {
  static const String id = '/loading';

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
  void _userListener(BuildContext ctx, UserState state) {
    if (state.status == UserStatus.success) {
      ctx.read<ProductListBloc>().add(ProductListLoaded());
    }

    if (state.status == UserStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _productListListener(BuildContext ctx, ProductListState state) {
    if (state.status == ProductListStatus.success) {
      final String userId = context.read<AuthBloc>().state.user!.uid;

      final List<Product> onSaleProducts =
          state.productList.where((d) => d.isOnSale).toList();

      ctx.read<ProductsOnSaleBloc>().add(ProductsOnSaleLoaded(
            onSaleProducts: onSaleProducts,
          ));
      ctx.read<CartBloc>().add(CartLoaded(userId: userId));
    }

    if (state.status == ProductListStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  void _cartListener(BuildContext ctx, CartState state) {
    if (state.status == CartStatus.success) {
      Navigator.pushNamed(ctx, NavigationPage.id);
    }

    if (state.status == CartStatus.failure) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listenWhen: (prev, curr) => prev.status == UserStatus.loading,
          listener: _userListener,
        ),
        BlocListener<ProductListBloc, ProductListState>(
          listener: _productListListener,
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (prev, curr) => prev.status == CartStatus.loading,
          listener: _cartListener,
        ),
      ],
      child: const LoadingView(),
    );
  }

  @override
  void initState() {
    super.initState();

    final String userId = context.read<AuthBloc>().state.user!.uid;

    context.read<UserBloc>().add(UserLoaded(userId: userId));
  }

  @override
  void deactivate() {
    // reset loading-page-level states
    context.read<UserBloc>().add(UserResetRequested());
    context.read<ProductListBloc>().add(ProductListResetRequested());
    context.read<ProductsOnSaleBloc>().add(ProductsOnSaleResetRequested());
    context.read<CartBloc>().add(CartResetRequested());
    super.deactivate();
  }
}
