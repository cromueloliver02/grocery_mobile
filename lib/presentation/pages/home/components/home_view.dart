import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './on_sale_section.dart';
import './our_products_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height / 3,
            child: Swiper(
              autoplay: true,
              itemCount: kBannerImages.length,
              // control: const SwiperControl(color: Colors.black),
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor: Colors.red,
                ),
              ),
              itemBuilder: (ctx, idx) => Image.asset(
                kBannerImages[idx],
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<ProductListBloc, ProductListState>(
            builder: (ctx, state) {
              if (state.status == ProductListStatus.initial) {
                return const SizedBox.shrink();
              }

              if (state.status == ProductListStatus.loading) {
                return const GCRLoadingCard();
              }

              if (state.status == ProductListStatus.failure) {
                return const GCRErrorCard();
              }

              return Column(
                children: const [
                  SizedBox(height: 10),
                  OnSaleSection(),
                  SizedBox(height: 10),
                  OurProductsSection(),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
