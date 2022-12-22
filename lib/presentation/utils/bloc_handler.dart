import '../../business_logic/blocs/blocs.dart';
import '../../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
    BlocProvider<NavigationCubit>(
      create: (ctx) => NavigationCubit(),
    ),
    BlocProvider<ProductFeedBloc>(
      create: (ctx) => ProductFeedBloc()..add(ProductFeedStarted()),
    ),
  ];
}
