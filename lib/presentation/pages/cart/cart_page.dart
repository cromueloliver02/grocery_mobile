import 'package:flutter/material.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../../utils/utils.dart';
import './components/cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void _cartListener(BuildContext ctx, CartState state) {
    if (state.status == CartStatus.failure) {
      FunctionHandler.showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (ctx) => CartBloc()..add(CartStarted()),
      child: BlocListener<CartBloc, CartState>(
        listener: _cartListener,
        child: const CartView(),
      ),
    );
  }
}
