import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ProductRepository productRepository;
  final CartRepository cartRepository;
  final UserRepository userRepository;

  AppBloc({
    required this.productRepository,
    required this.cartRepository,
    required this.userRepository,
  }) : super(AppState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<AppResetRequested>(_onAppResetRequested);
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: () => AppStatus.loading));

    try {
      final List<dynamic> responses = await Future.wait<dynamic>([
        productRepository.fetchProducts(),
        userRepository.fetchUser(userId: event.userId),
        cartRepository.fetchCartItems(event.userId),
      ]);

      final List<Product> productList = responses[0];
      final User user = responses[1];
      final List<CartItem> cartItems = responses[2];

      emit(state.copyWith(
        status: () => AppStatus.success,
        productList: () => productList,
        user: () => user,
        cart: () => Cart(userId: event.userId, cartItems: cartItems),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => AppStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void _onAppResetRequested(
    AppResetRequested event,
    Emitter<AppState> emit,
  ) {
    emit(AppState.initial());
  }
}
