import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShippingInfoSection extends StatelessWidget {
  const ShippingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your order is on the way',
                style: textTheme.headline4,
              ),
              const SizedBox(height: 10),
              Text(
                'Delivery Address',
                style: textTheme.headline5,
              ),
              const SizedBox(height: 10),
              Text(
                'Name: John Doe',
                style: textTheme.bodyText1,
              ),
              const SizedBox(height: 10),
              Text(
                'Address: Arabiat Echague, Isabela 3309',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: textTheme.bodyText1,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        SizedBox.square(
          dimension: 150,
          child: Lottie.network(
            'https://assets2.lottiefiles.com/private_files/lf30_f0fhps6k.json',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
