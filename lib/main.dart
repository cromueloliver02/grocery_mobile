import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './presentation/utils/utils.dart';
import './grocery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(GroceryApp(
    blocHandler: BlocHandler(),
    routeHandler: RouteHandler(),
    themeHandler: ThemeHandler(),
  ));
}
