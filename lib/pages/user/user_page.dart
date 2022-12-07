import 'package:flutter/material.dart';

import '../pages.dart';

class UserPage extends StatelessWidget {
  static const id = '${NavigationPage.id}/user';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('USER PAGE'),
    );
  }
}
