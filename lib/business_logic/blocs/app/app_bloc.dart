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

  AppBloc({
    required this.productRepository,
    required this.cartRepository,
  }) : super(AppState.initial()) {
    on<AppStarted>(_onAppStarted);
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));

    try {
      final List<Product> productList = await productRepository.fetchProducts();
      final List<CartItem> cartItems =
          await cartRepository.fetchCartItems(event.userId);

      emit(state.copyWith(
        status: AppStatus.success,
        productList: productList,
        cart: Cart(userId: event.userId, cartItems: cartItems),
      ));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: AppStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
