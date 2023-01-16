import 'package:flutter/material.dart';

import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';
import '../presentation/widgets/widgets.dart';
import '../presentation/pages/pages.dart';

// generated route access blocs/cubits
class RouteHandler {
  late AppBloc _appBloc;
  late ProductListBloc _productListBloc;
  late ProductsOnSaleBloc _productsOnSaleBloc;
  late CartBloc _cartBloc;
  late UserBloc _userBloc;
  late WishlistBloc _wishlistBloc;
  late ViewedRecentlyBloc _viewedRecentlyBloc;
  late CartActionCubit _cartActionCubit;
  late RemoveCartItemCubit _removeCartItemCubit;
  late DecrementCartItemCubit _decrementCartItemCubit;
  late UpdateCartItemQtyCubit _updateCartItemQtyCubit;
  late ClearCartCubit _clearCartCubit;
  late NavigationCubit _navigationCubit;

  RouteHandler({
    required ProductRepository productRepository,
    required CartRepository cartRepository,
    required UserRepository userRepository,
  }) {
    _appBloc = AppBloc(
      productRepository: productRepository,
      cartRepository: cartRepository,
      userRepository: userRepository,
    );
    _productListBloc = ProductListBloc(
      productRepository: productRepository,
    );
    _productsOnSaleBloc = ProductsOnSaleBloc();
    _cartBloc = CartBloc(cartRepository: cartRepository);
    _userBloc = UserBloc(userRepository: userRepository);
    _wishlistBloc = WishlistBloc();
    _viewedRecentlyBloc = ViewedRecentlyBloc();
    _cartActionCubit = CartActionCubit(
      cartBloc: _cartBloc,
      cartRepository: cartRepository,
    );
    _removeCartItemCubit = RemoveCartItemCubit(
      cartRepository: cartRepository,
    );
    _decrementCartItemCubit = DecrementCartItemCubit(
      cartRepository: cartRepository,
    );
    _updateCartItemQtyCubit = UpdateCartItemQtyCubit(
      cartRepository: cartRepository,
    );
    _clearCartCubit = ClearCartCubit(cartRepository: cartRepository);
    _navigationCubit = NavigationCubit();
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.id:
        return SplashPage.route(settings);
      case LoadingPage.id:
        return LoadingPage.route(
          settings,
          appBloc: _appBloc,
          productListBloc: _productListBloc,
          productsOnSaleBloc: _productsOnSaleBloc,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
        );
      case SignInPage.id:
        return SignInPage.route(settings);
      case SignUpPage.id:
        return SignUpPage.route(settings);
      case ForgetPasswordPage.id:
        return ForgetPasswordPage.route(settings);
      case NavigationPage.id:
        return NavigationPage.route(
          settings,
          productListBloc: _productListBloc,
          productsOnSaleBloc: _productsOnSaleBloc,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          cartActionCubit: _cartActionCubit,
          removeCartItemCubit: _removeCartItemCubit,
          decrementCartItemCubit: _decrementCartItemCubit,
          updateCartItemQtyCubit: _updateCartItemQtyCubit,
          clearCartCubit: _clearCartCubit,
          navigationCubit: _navigationCubit,
        );
      case ProductFeedsPage.id:
        return ProductFeedsPage.route(
          settings,
          productListBloc: _productListBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          navigationCubit: _navigationCubit,
        );
      case OnSalePage.id:
        return OnSalePage.route(
          settings,
          productsOnSaleBloc: _productsOnSaleBloc,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          cartActionCubit: _cartActionCubit,
          navigationCubit: _navigationCubit,
        );
      case ProductDetailsPage.id:
        return ProductDetailsPage.route(
          settings,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          cartActionCubit: _cartActionCubit,
          navigationCubit: _navigationCubit,
        );
      case CategoryProductsPage.id:
        return CategoryProductsPage.route(
          settings,
          productListBloc: _productListBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          navigationCubit: _navigationCubit,
        );
      case OrdersPage.id:
        return OrdersPage.route(settings);
      case WishlistPage.id:
        return WishlistPage.route(
          settings,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          cartActionCubit: _cartActionCubit,
          navigationCubit: _navigationCubit,
        );
      case ViewedRecentlyPage.id:
        return ViewedRecentlyPage.route(
          settings,
          cartBloc: _cartBloc,
          userBloc: _userBloc,
          wishlistBloc: _wishlistBloc,
          viewedRecentlyBloc: _viewedRecentlyBloc,
          cartActionCubit: _cartActionCubit,
          navigationCubit: _navigationCubit,
        );
    }

    return null;
  }

  Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/not-found.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              Text(
                '404: Page Not Found',
                style: Theme.of(ctx).textTheme.headline5,
              ),
              const SizedBox(height: 30),
              GCRButton.elevated(
                labelText: 'Go Back',
                onPressed: () => Navigator.pop(ctx),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispose() {
    _appBloc.close();
    _productListBloc.close();
    _productsOnSaleBloc.close();
    _cartBloc.close();
    _userBloc.close();
    _wishlistBloc.close();
    _viewedRecentlyBloc.close();
    _cartActionCubit.close();
    _navigationCubit.close();
  }
}
