import 'package:flutter/material.dart';

import './business_logic/cubits/cubits.dart';
import './presentation/pages/pages.dart';
import './utils/utils.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({
    super.key,
    required this.repositoryHandler,
    required this.blocHandler,
    required this.themeHandler,
  });

  final RepositoryHandler repositoryHandler;
  final BlocHandler blocHandler;
  final ThemeHandler themeHandler;

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  late final RouteHandler _routeHandler;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: widget.repositoryHandler.repositoryProviders,
      child: MultiBlocProvider(
        providers: widget.blocHandler.blocProviders,
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (ctx, state) => MaterialApp(
            title: 'Grocery Mobile',
            debugShowCheckedModeBanner: false,
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: widget.themeHandler.lightTheme,
            darkTheme: widget.themeHandler.darkTheme,
            initialRoute: SplashPage.id,
            onGenerateRoute: _routeHandler.onGenerateRoute,
            onUnknownRoute: _routeHandler.onUnknownRoute,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _routeHandler = RouteHandler(
      userRepository: widget.repositoryHandler.userRepository,
    );
  }

  @override
  void dispose() {
    _routeHandler.dispose();
    super.dispose();
  }
}
