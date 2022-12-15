import 'package:flutter/material.dart';

import '../business_logic/cubits/cubits.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({
    super.key,
    required this.blocHandler,
    required this.routeHandler,
    required this.themeHandler,
  });

  final BlocHandler blocHandler;
  final RouteHandler routeHandler;
  final ThemeHandler themeHandler;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocHandler.blocProviders,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (ctx, state) => MaterialApp(
          title: 'Grocery Mobile',
          debugShowCheckedModeBanner: false,
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: themeHandler.lightTheme,
          darkTheme: themeHandler.darkTheme,
          initialRoute: NavigationPage.id,
          onGenerateRoute: routeHandler.onGenerateRoute,
          onUnknownRoute: routeHandler.onUnknownRoute,
        ),
      ),
    );
  }
}
