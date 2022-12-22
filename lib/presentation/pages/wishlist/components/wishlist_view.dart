import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
// import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './wishlist_page_app_bar.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  // void _goToHomePage(BuildContext ctx) {
  //   Navigator.pop(ctx);
  //   ctx.read<NavigationCubit>().setCurrentIndex(0);
  // }

  @override
  Widget build(BuildContext context) {
    // if (true) {
    //   return Scaffold(
    //     body: GCREmptyMessageCard(
    //       image: 'assets/images/wishlist.png',
    //       message: 'Your wishlist is empty.',
    //       buttonText: 'Wishlist Now',
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
              const WishlistPageAppBar(),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 250 / 200,
                  ),
                  itemBuilder: (ctx, idx) => GCRProductCard.wishlist(
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
