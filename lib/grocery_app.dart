import 'package:flutter/material.dart';

import './cubits/cubits.dart';
import './pages/pages.dart';
import './utils/utils.dart';

class GroceryApp extends StatelessWidget {
  GroceryApp({super.key});

  final _blocHandler = BlocHandler();
  final _themeHandler = ThemeHandler();
  final _routeHandler = RouteHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocHandler.blocProviders,
      child: MaterialApp(
        title: 'Grocery Mobile',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // themeMode: ThemeMode.dark,
        theme: _themeHandler.lightTheme,
        darkTheme: _themeHandler.darkTheme,
        initialRoute: NavigationPage.id,
        routes: _routeHandler.routes,
      ),
    );
  }
}
