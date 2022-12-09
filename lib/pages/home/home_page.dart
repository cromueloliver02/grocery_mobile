import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
    final textTheme = Theme.of(context).textTheme;
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
          GCRButton.text(
            labelText: 'View All',
            onPressed: () {},
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ON SALE',
                        style: textTheme.headline3!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(right: 10),
                    separatorBuilder: (ctx, idx) => const SizedBox(width: 10),
                    itemBuilder: (ctx, idx) => const GCRProductCard.sale(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Products',
                  style: textTheme.headline3,
                ),
                GCRButton.text(
                  labelText: 'Browse All',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 370 / 450,
            children: const [
              GCRProductCard.feed(),
              GCRProductCard.feed(),
              GCRProductCard.feed(),
              GCRProductCard.feed(),
              GCRProductCard.feed(),
            ],
          )
        ],
      ),
    );
  }
}
