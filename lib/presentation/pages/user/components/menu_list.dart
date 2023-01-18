import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../business_logic/blocs/blocs.dart';
import '../../../../business_logic/cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';
import '../../../../utils/utils.dart';
import './address_dialog.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  void _showAddressDialog(
    BuildContext ctx, {
    required String initialValue,
  }) {
    showDialog<bool>(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>.value(value: ctx.read<UserBloc>()),
          BlocProvider<UserActionCubit>.value(
            value: ctx.read<UserActionCubit>(),
          ),
        ],
        child: AddressDialog(initialValue: initialValue),
      ),
    );
  }

  void _showSignOutDialog(BuildContext ctx) async {
    final AuthBloc authBloc = ctx.read<AuthBloc>();

    final bool? response = await showWarningDialog(
      ctx,
      title: 'Sign Out',
      message: 'Do you wanna sign out?',
    );

    if (response != null && response) {
      authBloc.add(AuthSignoutRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (ctx, state) => GCRMenuListTile(
            title: 'Address',
            subtitle: state.user.shipAddress,
            trailing: const Icon(IconlyLight.arrowRight2),
            leading: Icon(
              IconlyLight.profile,
              color: Colors.grey[600],
            ),
            onTap: () => _showAddressDialog(
              context,
              initialValue: state.user.shipAddress ?? '',
            ),
          ),
        ),
        GCRMenuListTile(
          title: 'Orders',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.bag,
            color: Colors.grey[600],
          ),
          onTap: () => Navigator.pushNamed(context, OrdersPage.id),
        ),
        GCRMenuListTile(
          title: 'Wishlist',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.heart,
            color: Colors.grey[600],
          ),
          onTap: () => Navigator.pushNamed(context, WishlistPage.id),
        ),
        GCRMenuListTile(
          title: 'Viewed Recently',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.show,
            color: Colors.grey[600],
          ),
          onTap: () => Navigator.pushNamed(context, ViewedRecentlyPage.id),
        ),
        GCRMenuListTile(
          title: 'Forget password',
          trailing: const Icon(IconlyLight.arrowRight2),
          leading: Icon(
            IconlyLight.unlock,
            color: Colors.grey[600],
          ),
          onTap: () => Navigator.pushNamed(context, ForgetPasswordPage.id),
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
