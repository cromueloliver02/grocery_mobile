import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import './address_dialog.dart';
import './sign_out_dialog.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  void _showAddressDialog(BuildContext ctx) => showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) => const AddressDialog(),
      );

  void _showSignOutDialog(BuildContext ctx) => showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) => const SignOutDialog(),
      );

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
          onTap: () {},
        ),
        GCRMenuListTile(
          title: 'Wishlist',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.heart,
            color: Colors.grey[600],
          ),
          onTap: () {},
        ),
        GCRMenuListTile(
          title: 'Viewed',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.show,
            color: Colors.grey[600],
          ),
          onTap: () {},
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
          builder: (ctx, state) {
            return GCRMenuListTile(
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
            );
          },
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
