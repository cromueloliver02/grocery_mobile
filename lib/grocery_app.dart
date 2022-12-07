import 'package:flutter/material.dart';

import './utils/utils.dart';

class GroceryApp extends StatelessWidget {
  GroceryApp({super.key});

  final _themeHandler = ThemeHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Mobile',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: _themeHandler.lightTheme,
      darkTheme: _themeHandler.darkTheme,
      home: const Scaffold(
        body: Center(
          child: Text('GROCERY MOBILE APP'),
        ),
      ),
    );
  }
}
