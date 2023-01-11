import 'package:flutter/material.dart';

import './business_logic/cubits/cubits.dart';
import './presentation/pages/pages.dart';
import './utils/utils.dart';
import './global_providers.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (ctx, state) => MaterialApp(
          title: 'Grocery Mobile',
          debugShowCheckedModeBanner: false,
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ctx.read<ThemeHandler>().lightTheme,
          darkTheme: ctx.read<ThemeHandler>().darkTheme,
          initialRoute: SplashPage.id,
          onGenerateRoute: ctx.read<RouteHandler>().onGenerateRoute,
          onUnknownRoute: ctx.read<RouteHandler>().onUnknownRoute,
        ),
      ),
    );
  }
}
