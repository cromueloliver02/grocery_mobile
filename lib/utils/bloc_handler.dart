import '../cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
  ];
}
