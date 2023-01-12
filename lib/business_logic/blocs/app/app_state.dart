part of 'app_bloc.dart';

class AppState extends Equatable {
  final List<Product> productList;
  final Cart cart;
  final User user;
  final AppStatus status;
  final GCRError error;

  const AppState({
    required this.productList,
    required this.cart,
    required this.user,
    required this.status,
    required this.error,
  });

  factory AppState.initial() {
    return AppState(
      productList: const <Product>[],
      cart: Cart.initial(),
      user: User.initial(),
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
    List<Product> Function()? productList,
    Cart Function()? cart,
    User Function()? user,
    AppStatus Function()? status,
    GCRError Function()? error,
  }) {
    return AppState(
      productList: productList != null ? productList() : this.productList,
      cart: cart != null ? cart() : this.cart,
      user: user != null ? user() : this.user,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
