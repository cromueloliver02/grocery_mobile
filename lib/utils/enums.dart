enum MeasureUnit { kg, piece }

enum ProductCardType {
  sale,
  feed,
  wishlist,
  viewed,
}

enum ButtonType { elevated, text }

enum GCRPlatform { iOs, android }

enum AuthStatus { unknown, unauthenticated, authenticated, failure }

enum CartItemQtyAction { increment, decrement }

enum CartActionType {
  initial,
  addToCart,
  removeFromCart,
  incrementQty,
  decrementQty,
  updateQty,
  clearCart,
}

enum WishlistActionType { initial, add, remove, clear }

// ASYNC
enum LoadingStatus { initial, loading, success, failure }

enum SigninStatus { initial, loading, success, failure }

enum SignupStatus { initial, loading, success, failure }

enum ForgetPwdStatus { initial, loading, success, failure }

enum UserActionStatus { initial, loading, success, failure }

enum CartActionStatus { initial, loading, success, failure }

enum OrderStatus { initial, loading, success, failure }

enum WishlistStatus { initial, loading, success, failure }

enum WishlistActionStatus { initial, loading, success, failure }

enum ViewedRecentlyStatus { initial, loading, success, failure }

enum ViewedRecentlyActionStatus { initial, loading, success, failure }

enum SearchProductStatus { initial, loading, success, failure }
