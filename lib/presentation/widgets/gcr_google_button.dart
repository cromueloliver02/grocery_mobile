import 'package:flutter/material.dart';

class GCRGoogleButton extends StatelessWidget {
  const GCRGoogleButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/google.png'),
              ),
              const SizedBox(width: 20),
              Text(
                'Sign In With Google',
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: textTheme.bodyLarge!.fontSize! + 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
