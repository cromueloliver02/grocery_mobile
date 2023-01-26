import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../../business_logic/blocs/blocs.dart';
import './menu_list.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

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
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (ctx, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: 'Hi, ',
                          style: textTheme.headline2!.copyWith(
                            color: Colors.cyan,
                            fontSize: textTheme.headline2!.fontSize! + 2,
                          ),
                          children: [
                            TextSpan(
                              text: state.user.name,
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
                        state.user.email,
                        style: textTheme.bodyText1!.copyWith(
                          fontSize: textTheme.bodyText1!.fontSize! + 4,
                        ),
                      ),
                    ],
                  ),
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
