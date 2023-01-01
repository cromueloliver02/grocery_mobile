import 'package:flutter/material.dart';

class GCRTextFormField extends StatelessWidget {
  const GCRTextFormField({
    super.key,
    required this.hintText,
    this.focusNode,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
  });

  final String hintText;
  final FocusNode? focusNode;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      enabled: enabled,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[300]),
        suffixIcon: suffixIcon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      validator: validator,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
    );
  }
}
