import 'package:flutter/material.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const Scaffold(
        body: Center(
          child: Text('GROCERY MOBILE APP'),
        ),
      ),
    );
  }
}
