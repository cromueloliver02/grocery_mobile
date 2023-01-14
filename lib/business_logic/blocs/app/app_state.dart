part of 'app_bloc.dart';

class AppState extends Equatable {
  final List<Product> productList;
  final User user;
  final Cart cart;
  final AppStatus status;
  final GCRError error;

  const AppState({
    required this.productList,
    required this.user,
    required this.cart,
    required this.status,
    required this.error,
  });

  factory AppState.initial() {
    return AppState(
      productList: const <Product>[],
      user: User.initial(),
      cart: Cart.initial(),
      status: AppStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [productList, user, cart, status, error];

  @override
  String toString() {
    return 'AppState(productList: $productList, user: $user, cart: $cart, status: $status, error: $error)';
  }

  AppState copyWith({
    List<Product> Function()? productList,
    User Function()? user,
    Cart Function()? cart,
    AppStatus Function()? status,
    GCRError Function()? error,
  }) {
    return AppState(
      productList: productList != null ? productList() : this.productList,
      user: user != null ? user() : this.user,
      cart: cart != null ? cart() : this.cart,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
