import '../../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
  ];
}
