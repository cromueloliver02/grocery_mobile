enum MeasureUnit { kg, piece }

enum ProductCardType {
  sale,
  feed,
  cart,
  wishlist,
  viewed,
}

enum ButtonType { elevated, text }

enum GCRPlatform { iOs, android }

enum CartItemQtyAction { increment, decrement }

enum AuthStatus { unknown, unauthenticated, authenticated }

// ASYNC
enum AppStatus { initial, loading, success, failure }

enum SigninStatus { initial, loading, success, failure }

enum SignupStatus { initial, loading, success, failure }

enum ForgetPwdStatus { initial, loading, success, failure }

enum UpdateShipAddressStatus { initial, loading, success, failure }

enum AddCartItemStatus { initial, loading, success, failure }

enum RemoveCartItemStatus { initial, loading, success, failure }

enum ClearCartStatus { initial, loading, success, failure }

enum IncrementCartItemStatus { initial, loading, success, failure }

enum DecrementCartItemStatus { initial, loading, success, failure }

enum UpdateCartItemQtyStatus { initial, loading, success, failure }

enum WishlistStatus { initial, loading, success, failure }

enum WishlistFormStatus { initial, loading, success, failure }

enum ViewedRecentlyStatus { initial, loading, success, failure }

enum ViewedRecentlyFormStatus { initial, loading, success, failure }

enum SearchProductStatus { initial, loading, success, failure }
