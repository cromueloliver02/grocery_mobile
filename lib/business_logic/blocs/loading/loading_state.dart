part of 'loading_bloc.dart';

class LoadingState extends Equatable {
  final List<Product> productList;
  final User user;
  final Cart cart;
  final LoadingStatus status;
  final GCRError error;

  const LoadingState({
    required this.productList,
    required this.user,
    required this.cart,
    required this.status,
    required this.error,
  });

  factory LoadingState.initial() {
    return LoadingState(
      productList: const <Product>[],
      user: User.initial(),
      cart: Cart.initial(),
      status: LoadingStatus.initial,
      error: const GCRError(),
    );
  }

  @override
  List<Object> get props => [productList, user, cart, status, error];

  @override
  String toString() {
    return 'LoadingState(productList: $productList, user: $user, cart: $cart, status: $status, error: $error)';
  }

  LoadingState copyWith({
    List<Product> Function()? productList,
    User Function()? user,
    Cart Function()? cart,
    LoadingStatus Function()? status,
    GCRError Function()? error,
  }) {
    return LoadingState(
      productList: productList != null ? productList() : this.productList,
      user: user != null ? user() : this.user,
      cart: cart != null ? cart() : this.cart,
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
