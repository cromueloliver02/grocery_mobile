import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class BlocHandler {
  // global access blocs/cubits
  final List<BlocProvider> blocProviders = [
    BlocProvider<AuthBloc>(
      create: (ctx) => AuthBloc(
        authRepository: ctx.read<AuthRepository>(),
      ),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
  ];
}
