part of 'app_bloc.dart';

class AppState extends Equatable {
  final List<Product> productList;
  final Cart cart;
  final AppStatus status;
  final GCRError error;

  const AppState({
    required this.productList,
    required this.cart,
    required this.status,
    required this.error,
  });

  factory AppState.initial() {
    return AppState(
      productList: const <Product>[],
      cart: Cart(userId: '', cartItems: <CartItem>[]),
      status: AppStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [productList, cart, status, error];

  @override
  String toString() {
    return 'AppState(productList: $productList, cart: $cart, status: $status, error: $error)';
  }

  AppState copyWith({
    List<Product>? productList,
    Cart? cart,
    AppStatus? status,
    GCRError? error,
  }) {
    return AppState(
      productList: productList ?? this.productList,
      cart: cart ?? this.cart,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
