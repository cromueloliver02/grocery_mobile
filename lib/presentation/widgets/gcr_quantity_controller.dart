import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../business_logic/blocs/blocs.dart';
import '../../business_logic/cubits/cubits.dart';
import '../../data/models/models.dart';

class GCRQuantityController extends StatefulWidget {
  const GCRQuantityController({
    super.key,
    required this.qtyController,
    required this.cartItemId,
    required this.quantity,
  });

  final TextEditingController qtyController;
  final String cartItemId;
  final int quantity;

  @override
  State<GCRQuantityController> createState() => _GCRQuantityControllerState();
}

class _GCRQuantityControllerState extends State<GCRQuantityController> {
  late final FocusNode _qtyNode;

  void _incrementQuantity(BuildContext ctx, {required String cartItemId}) {
    final String userId = ctx.read<UserBloc>().state.user.id;
    final List<CartItem> cartItems = ctx.read<CartBloc>().state.cart.cartItems;

    ctx.read<CartActionCubit>().incrementCartItem(
          userId: userId,
          cartItemId: cartItemId,
          cartItems: cartItems,
        );
  }

  void _decrementQuantity(BuildContext ctx, {required String cartItemId}) {
    if (widget.quantity <= 1) return;

    final String userId = ctx.read<UserBloc>().state.user.id;
    final List<CartItem> cartItems = ctx.read<CartBloc>().state.cart.cartItems;

    ctx.read<CartActionCubit>().decrementCartItem(
          userId: userId,
          cartItemId: cartItemId,
          cartItems: cartItems,
        );
  }

  void _onChanged(String value) {
    if (value.trim().isEmpty) widget.qtyController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _decrementQuantity(
            context,
            cartItemId: widget.cartItemId,
          ),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: TextField(
            controller: widget.qtyController,
            focusNode: _qtyNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: InputDecoration(
              labelStyle: textTheme.bodyText2,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: _onChanged,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _incrementQuantity(
            context,
            cartItemId: widget.cartItemId,
          ),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _qtyNode = FocusNode();

    _qtyNode.addListener(() {
      if (!_qtyNode.hasFocus &&
          widget.quantity != int.parse(widget.qtyController.text)) {
        final String userId = context.read<UserBloc>().state.user.id;
        final List<CartItem> cartItems =
            context.read<CartBloc>().state.cart.cartItems;

        context.read<CartActionCubit>().updateCartItemQty(
              userId: userId,
              cartItemId: widget.cartItemId,
              cartItems: cartItems,
              newQuantity: int.parse(widget.qtyController.text),
            );
      }
    });
  }
}
