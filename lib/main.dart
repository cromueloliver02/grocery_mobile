import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './grocery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GroceryApp());
}
