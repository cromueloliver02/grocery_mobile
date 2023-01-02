import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../utils/utils.dart';

class GCRAuthBackgroundCarousel extends StatelessWidget {
  const GCRAuthBackgroundCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height,
      child: Swiper(
        autoplay: true,
        duration: kDefaultAutoplayTransactionDuration + 500,
        autoplayDelay: kDefaultAutoplayDelayMs + 3000,
        itemCount: kAuthImagesPaths.length,
        itemBuilder: (ctx, idx) => Image.asset(
          kAuthImagesPaths[idx],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
