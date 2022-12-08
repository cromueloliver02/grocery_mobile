import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../pages.dart';

class HomePage extends StatelessWidget {
  static const id = '${NavigationPage.id}/home';

  HomePage({super.key});

  final _bannerImages = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height / 3,
      child: Swiper(
        autoplay: true,
        itemCount: _bannerImages.length,
        // control: const SwiperControl(color: Colors.black),
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: Colors.red,
          ),
        ),
        itemBuilder: (ctx, idx) => Image.asset(
          _bannerImages[idx],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
