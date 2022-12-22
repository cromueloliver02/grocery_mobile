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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductListBloc, ProductListState>(
      listener: _productFeedListener,
      child: const HomeView(),
    );
  }
}
