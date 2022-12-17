import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import './wishlist_page_app_bar.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 250 / 200,
                  ),
                  itemBuilder: (ctx, idx) => const GCRProductCard.wishlist(
                    price: 6.99,
                    salePrice: 4.99,
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
