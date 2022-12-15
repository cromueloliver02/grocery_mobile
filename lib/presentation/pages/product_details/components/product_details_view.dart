import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../presentation/widgets/widgets.dart';
import './product_details_page_bottom_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: const ProductDetailsPageBottomBar(),
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
            width: screenSize.width,
            height: screenSize.height * 0.4,
            boxFit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apple',
                      style: textTheme.headline2,
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      color: Colors.red,
                      icon: const Icon(IconlyLight.heart),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '\$5.93 ',
                        style: textTheme.headline2!.copyWith(
                          color: Colors.green,
                        ),
                        children: [
                          TextSpan(
                            text: '/Kg',
                            style: textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '\$8.37',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: textTheme.bodyText1!.fontSize! + 2,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Free Delivery',
                        style: textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const GCRQuantityController(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
