import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:recase/recase.dart';

class ShippingInfoSection extends StatelessWidget {
  const ShippingInfoSection({
    super.key,
    required this.userName,
    required this.userAddress,
    required this.orderedAt,
    required this.totalPaid,
  });

  final String userName;
  final String userAddress;
  final DateTime orderedAt;
  final double totalPaid;

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
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Delivery Address',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Name: ${userName.titleCase}',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Address: $userAddress',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Ordered Time: ${DateFormat('h:mm a').format(orderedAt)}',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: textTheme.bodyLarge,
              ),
              Text(
                'Ordered Date: ${DateFormat('MMMM dd, yyyy').format(orderedAt)}',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Total Paid: \$${totalPaid.toStringAsFixed(2)}',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: textTheme.bodyLarge,
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
