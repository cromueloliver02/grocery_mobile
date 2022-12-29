import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../business_logic/blocs/blocs.dart';

class GCRQuantityController extends StatelessWidget {
  const GCRQuantityController({
    super.key,
    required this.qtyController,
    required this.cartItemId,
    required this.quantity,
  });

  final TextEditingController qtyController;
  final String cartItemId;
  final int quantity;

  void _incrementQuantity(BuildContext ctx) {
    ctx.read<CartBloc>().add(CartItemIncremented(id: cartItemId));
  }

  void _decrementQuantity(BuildContext ctx) {
    if (quantity <= 1) return;

    ctx.read<CartBloc>().add(CartItemDecremented(id: cartItemId));
  }

  void _onChanged(String value) {
    if (value.trim().isEmpty) qtyController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _decrementQuantity(context),
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
            controller: qtyController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: _onChanged,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: InputDecoration(
              labelStyle: textTheme.bodyText2,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _incrementQuantity(context),
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
}
