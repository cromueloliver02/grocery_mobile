enum MeasureUnit { kg, piece }

enum ProductCardType {
  sale,
  feed,
  wishlist,
  viewed,
}

enum ButtonType { elevated, text }

enum GCRPlatform { iOs, android }

enum AuthStatus { unknown, unauthenticated, authenticated }

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

enum WishlistActionType { initial, add, remove }

// ASYNC
enum LoadingStatus { initial, loading, success, failure }

enum SigninStatus { initial, loading, success, failure }

enum SignupStatus { initial, loading, success, failure }

enum ForgetPwdStatus { initial, loading, success, failure }

enum UpdateShipAddressStatus { initial, loading, success, failure }

enum CartActionStatus { initial, loading, success, failure }

enum WishlistStatus { initial, loading, success, failure }

// TODO: to be deleted
enum WishlistFormStatus { initial, loading, success, failure }

enum WishlistActionStatus { initial, loading, success, failure }

enum ViewedRecentlyStatus { initial, loading, success, failure }

enum ViewedRecentlyFormStatus { initial, loading, success, failure }

enum SearchProductStatus { initial, loading, success, failure }
