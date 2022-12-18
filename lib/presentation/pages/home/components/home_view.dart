import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import './on_sale_section.dart';
import './our_products_section.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _bannerImages = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
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
          const OnSaleSection(),
          const SizedBox(height: 10),
          const OurProductsSection(),
        ],
      ),
    );
  }
}
