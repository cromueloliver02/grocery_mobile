import 'package:flutter/material.dart';

// import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './cart_page_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  // void _goToHomePage(BuildContext ctx) {
  //   ctx.read<NavigationCubit>().setCurrentIndex(0);
  // }

  @override
  Widget build(BuildContext context) {
    // if (true) {
    //   return GCREmptyMessageCard(
    //     image: 'assets/images/cart.png',
    //     message: 'Your cart is empty.',
    //     buttonText: 'Shop Now',
    //     onRedirect: () => _goToHomePage(context),
    //   );
    // }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const CartPageAppBar(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: const EdgeInsets.symmetric(vertical: 20),
                separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
                itemBuilder: (ctx, idx) => const GCRProductCard.cart(
                  price: 3.29,
                  salePrice: 2.87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
