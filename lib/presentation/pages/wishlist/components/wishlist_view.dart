import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../../utils/utils.dart';
import './wishlist_page_app_bar.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  void _goToHomePage(BuildContext ctx) {
    Navigator.pop(ctx);
    ctx.read<NavigationCubit>().setCurrentIndex(0);
  }

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
                child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (ctx, state) {
                    if (state.status == WishlistStatus.initial) {
                      return const SizedBox.shrink();
                    }

                    if (state.status == WishlistStatus.loading) {
                      return const GCRLoadingCard();
                    }

                    if (state.status == WishlistStatus.failure) {
                      return const GCRErrorCard();
                    }

                    if (state.wishlist.wishlistItems.isEmpty) {
                      return GCREmptyMessageCard(
                        image: 'assets/images/wishlist.png',
                        message: 'Your wishlist is empty.',
                        buttonText: 'Wishlist Now',
                        onRedirect: () => _goToHomePage(context),
                      );
                    }

                    return GridView.builder(
                      itemCount: state.wishlist.wishlistItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 240 / 200,
                      ),
                      itemBuilder: (ctx, idx) => GCRProductCard.wishlist(
                        product: state.wishlist.wishlistItems[idx].product,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
