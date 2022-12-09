import 'package:flutter/material.dart';

import './business_logic/cubits/cubits.dart';
import './presentation/pages/pages.dart';
import './presentation/utils/utils.dart';

class GroceryApp extends StatelessWidget {
  GroceryApp({super.key});

  final _blocHandler = BlocHandler();
  final _themeHandler = ThemeHandler();
  final _routeHandler = RouteHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocHandler.blocProviders,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (ctx, state) => MaterialApp(
          title: 'Grocery Mobile',
          debugShowCheckedModeBanner: false,
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: _themeHandler.lightTheme,
          darkTheme: _themeHandler.darkTheme,
          initialRoute: NavigationPage.id,
          routes: _routeHandler.routes,
          onUnknownRoute: _routeHandler.onUnknownRoute,
        ),
      ),
    );
  }
}
