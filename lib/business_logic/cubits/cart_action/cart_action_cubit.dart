import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';
import '../../blocs/blocs.dart';

part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  final CartRepository cartRepository;
  final CartBloc cartBloc;

  CartActionCubit({
    required this.cartRepository,
    required this.cartBloc,
  }) : super(CartActionState.initial());

  void addToCart({
    required String userId,
    required Product product,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      final CartItem cartItem = CartItem(
        id: uuid.v4(),
        product: product,
        quantity: 1,
      );

      final CartItem newCartItem = await cartRepository.addToCart(
        userId: userId,
        cartItem: cartItem,
      );

      cartBloc.add(CartItemAdded(cartItem: newCartItem));

      showToast(
        'Added to cart',
        gravity: ToastGravity.BOTTOM,
      );

      emit(state.copyWith(status: () => CartActionStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }

  void incrementCartItem({
    required String userId,
    required String cartItemId,
  }) async {
    emit(state.copyWith(status: () => CartActionStatus.loading));

    try {
      cartBloc.add(CartItemIncremented(cartItemId: cartItemId));

      emit(state.copyWith(status: () => CartActionStatus.success));

      await cartRepository.changeCartItemQty(
        userId: userId,
        cartItemId: cartItemId,
        action: CartItemQtyAction.increment,
      );
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => CartActionStatus.failure,
        error: () => err,
      ));

      debugPrint(state.toString());
    }
  }
}
