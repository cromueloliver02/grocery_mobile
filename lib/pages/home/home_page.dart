import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../widgets/widgets.dart';
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

    return Column(
      children: [
        SizedBox(
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
        ),
        const SizedBox(height: 5),
        GCRButton.text(
          labelText: 'View All',
          onPressed: () {},
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: (ctx, idx) => const SizedBox(width: 10),
            itemBuilder: (ctx, idx) => const GCRProductCard(),
          ),
        ),
      ],
    );
  }
}
