import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../data/models/models.dart';
import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';

class CartPageAppBar extends StatelessWidget {
  const CartPageAppBar({super.key});

  void _showClearCartDialog(BuildContext ctx) async {
    final UserBloc userBloc = ctx.read<UserBloc>();
    final CartActionCubit clearCartCubit = ctx.read<CartActionCubit>();

    final bool? response = await showWarningDialog(
      ctx,
      title: 'Clear Cart',
      message: 'Do you wanna clear your cart?',
    );

    if (response != null && response) {
      final String userId = userBloc.state.user.id;

      clearCartCubit.clearCart(
        userId: userId,
        actionType: CartActionType.clearCart,
      );
    }
  }

  void _placeOrder(BuildContext ctx) async {
    final UserBloc userBloc = ctx.read<UserBloc>();

    if (userBloc.state.user.shipAddress == null ||
        userBloc.state.user.shipAddress!.isEmpty) {
      showInfoDialog(
        ctx,
        title: 'Provide Shipping Address',
        message:
            'Please provide your shipping address first before placing order',
      );
      return;
    }

    final User user = userBloc.state.user;
    final CartBloc cartBloc = ctx.read<CartBloc>();
    final List<CartItem> cartItems = cartBloc.state.cart.cartItems;

    final OrderItem orderItem = OrderItem(
      id: '', // id is auto-generated in the backend
      user: user,
      cartItems: cartItems,
    );

    ctx.read<OrderActionCubit>().placeOrder(orderItem);
    ctx.read<CartActionCubit>().clearCart(
          userId: user.id,
          actionType: CartActionType.placeOrder,
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CartBloc, CartState>(
      builder: (ctx, state) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 10),
            title: Text(
              'Cart (${state.cart.cartItems.length})',
              style: textTheme.headline3,
            ),
            trailing: state.cart.cartItems.isEmpty
                ? null
                : IconButton(
                    onPressed: () => _showClearCartDialog(context),
                    iconSize: 30,
                    icon: const Icon(IconlyBroken.delete),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (ctx, state) => GCRButton.elevated(
                    labelText: 'Place Order',
                    onPressed: state.cart.cartItems.isEmpty
                        ? null
                        : () => _placeOrder(context),
                  ),
                ),
                Text(
                  'Total: \$${state.cart.grandTotalPrice.toStringAsFixed(2)}',
                  style: textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
