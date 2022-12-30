import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../../presentation/utils/utils.dart';
import './components/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _productFeedListener(BuildContext ctx, ProductListState state) {
    if (state.status == ProductListStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }

    if (state.status == ProductListStatus.success) {
      ctx
          .read<ProductsOnSaleBloc>()
          .add(ProductsOnSaleStarted(productList: state.productList));
    }
  }

  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.formStatus == WishlistFormStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductListBloc, ProductListState>(
          listener: _productFeedListener,
        ),
        BlocListener<WishlistBloc, WishlistState>(
          listener: _wishlistListener,
        ),
      ],
      child: const HomeView(),
    );
  }
}
