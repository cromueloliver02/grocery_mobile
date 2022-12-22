import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GCRQuantityController extends StatelessWidget {
  const GCRQuantityController({
    super.key,
    required this.qtyController,
  });

  final TextEditingController qtyController;

  void _incrementQuantity() {
    qtyController.text = (int.parse(qtyController.text) + 1).toString();
  }

  void _decrementQuantity() {
    final int quantity = int.parse(qtyController.text);

    if (quantity == 1) return;

    qtyController.text = (quantity - 1).toString();
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
          onTap: _decrementQuantity,
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
          onTap: _incrementQuantity,
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
