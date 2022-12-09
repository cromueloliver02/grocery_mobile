import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../pages.dart';
import './components/menu_list.dart';

class UserPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/user';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
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
              const MenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
