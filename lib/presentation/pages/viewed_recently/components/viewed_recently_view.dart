import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
// import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './viewed_recently_page_app_bar.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  // void _goToHomePage(BuildContext ctx) {
  //   Navigator.pop(ctx);
  //   ctx.read<NavigationCubit>().setCurrentIndex(0);
  // }

  @override
  Widget build(BuildContext context) {
    // if (true) {
    //   return Scaffold(
    //     body: GCREmptyMessageCard(
    //       image: 'assets/images/history.png',
    //       message: 'You haven\'t viewed any products yet.',
    //       buttonText: 'Browse Now',
    //       onRedirect: () => _goToHomePage(context),
    //     ),
    //   );
    // }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const ViewedRecentlyPageAppBar(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 19,
                  separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
                  itemBuilder: (ctx, idx) => GCRProductCard.viewed(
                    product: Product.productList[0],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
