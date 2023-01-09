import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './cart_page_app_bar.dart';
import './cart_item_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  void _goToHomePage(BuildContext ctx) {
    ctx.read<NavigationCubit>().setCurrentIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const CartPageAppBar(),
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (ctx, state) {
                  if (state.cart.cartItems.isEmpty) {
                    return GCREmptyMessageCard(
                      image: 'assets/images/cart.png',
                      message: 'Your cart is empty.',
                      buttonText: 'Shop Now',
                      onRedirect: () => _goToHomePage(context),
                    );
                  }

                  return CartItemList(cartItems: state.cart.cartItems);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
