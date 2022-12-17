import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';
import '../../../utils/utils.dart';
import './address_dialog.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  void _showAddressDialog(BuildContext ctx) => showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) => const AddressDialog(),
      );

  void _goToOrdersPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        OrdersPage.id,
      );

  void _goToWishlistPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        WishlistPage.id,
      );

  void _goToViewedRecentlyPage(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        ViewedRecentlyPage.id,
      );

  void _showSignOutDialog(BuildContext ctx) async {
    final bool? response = await FunctionHandler.showWarningDialog(
      ctx,
      title: 'Sign Out',
      message: 'Do you wanna sign out?',
    );

    debugPrint(response.toString());
    // sign out functionality
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GCRMenuListTile(
          title: 'Address',
          subtitle: 'Baguio City, Philippines',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.profile,
            color: Colors.grey[600],
          ),
          onTap: () => _showAddressDialog(context),
        ),
        GCRMenuListTile(
          title: 'Orders',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.bag,
            color: Colors.grey[600],
          ),
          onTap: () => _goToOrdersPage(context),
        ),
        GCRMenuListTile(
          title: 'Wishlist',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.heart,
            color: Colors.grey[600],
          ),
          onTap: () => _goToWishlistPage(context),
        ),
        GCRMenuListTile(
          title: 'Viewed Recently',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.show,
            color: Colors.grey[600],
          ),
          onTap: () => _goToViewedRecentlyPage(context),
        ),
        GCRMenuListTile(
          title: 'Forget password',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.unlock,
            color: Colors.grey[600],
          ),
          onTap: () {},
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (ctx, state) => GCRMenuListTile(
            title: 'Dark mode',
            leading: Icon(
              state.isDark ? Icons.dark_mode : Icons.light_mode,
              color: Colors.grey[600],
            ),
            trailing: Switch(
              value: state.isDark,
              onChanged: (value) => ctx.read<ThemeCubit>().toggleTheme(),
            ),
            onTap: () {},
          ),
        ),
        GCRMenuListTile(
          title: 'Logout',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.logout,
            color: Colors.grey[600],
          ),
          onTap: () => _showSignOutDialog(context),
        ),
      ],
    );
  }
}
