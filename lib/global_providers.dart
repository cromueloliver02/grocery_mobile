import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import './utils/utils.dart';

class GlobalProviders extends StatefulWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<GlobalProviders> createState() => _GlobalProvidersState();
}

class _GlobalProvidersState extends State<GlobalProviders> {
  late final RepositoryHandler _repositoryHandler;
  late final BlocHandler _blocHandler;
  late final RouteHandler _routeHandler;
  late final ThemeHandler _themeHandler;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RouteHandler>.value(value: _routeHandler),
        Provider<ThemeHandler>.value(value: _themeHandler),
      ],
      child: MultiRepositoryProvider(
        providers: _repositoryHandler.repositoryProviders,
        child: MultiBlocProvider(
          providers: _blocHandler.blocProviders,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _repositoryHandler = RepositoryHandler(
      userService: userService,
      cartService: cartService,
      productService: productService,
    );

    _blocHandler = BlocHandler();

    _routeHandler = RouteHandler(
      userRepository: _repositoryHandler.userRepository,
      cartRepository: _repositoryHandler.cartRepository,
    );

    _themeHandler = ThemeHandler();
  }

  @override
  void dispose() {
    _routeHandler.dispose();
    super.dispose();
  }
}
