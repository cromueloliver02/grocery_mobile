import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../cubits/cubits.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class UserPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/user';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hi, ',
                      style: textTheme.headline2!.copyWith(
                        color: Colors.cyan,
                        fontSize: textTheme.headline2!.fontSize! + 2,
                      ),
                      children: [
                        TextSpan(
                          text: 'John Doe',
                          style: textTheme.headline2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // This is just for learning purposes
                              debugPrint('Tapped...');
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'email@email.com',
                    style: textTheme.bodyText1!.copyWith(
                      fontSize: textTheme.bodyText1!.fontSize! + 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            GCRMenuListTile(
              title: 'Address',
              subtitle: 'Baguio City, Philippines',
              trailing: const Icon(IconlyLight.arrowRight2),
              leading: Icon(
                IconlyLight.profile,
                color: Colors.grey[600],
              ),
              onTap: () {},
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
