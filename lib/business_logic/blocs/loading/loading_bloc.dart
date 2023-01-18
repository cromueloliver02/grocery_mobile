import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  final ProductRepository productRepository;
  final CartRepository cartRepository;
  final UserRepository userRepository;

  LoadingBloc({
    required this.productRepository,
    required this.cartRepository,
    required this.userRepository,
  }) : super(LoadingState.initial()) {
    on<LoadingStarted>(_onAppStarted);
    on<LoadingResetRequested>(_onAppResetRequested);
  }

  void _onAppStarted(LoadingStarted event, Emitter<LoadingState> emit) async {
    emit(state.copyWith(status: () => LoadingStatus.loading));

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
        status: () => LoadingStatus.success,
        productList: () => productList,
        user: () => user,
        cart: () => Cart(userId: event.userId, cartItems: cartItems),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => LoadingStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void _onAppResetRequested(
    LoadingResetRequested event,
    Emitter<LoadingState> emit,
  ) {
    emit(LoadingState.initial());
  }
}
