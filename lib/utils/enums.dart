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

enum AuthStatus { unknown, unauthenticated, authenticated }

// ASYNC
enum SigninStatus { initial, loading, success, failure }

enum SignupStatus { initial, loading, success, failure }

enum ForgetPwdStatus { initial, loading, success, failure }

enum UserStatus { initial, loading, success, failure }

enum UserFormStatus { initial, loading, success, failure }

enum ProductListStatus { initial, loading, success, failure }

enum CartStatus { initial, loading, success, failure }

enum CartFormStatus { initial, loading, success, failure }

enum AddCartItemStatus { initial, loading, success, failure }

enum WishlistStatus { initial, loading, success, failure }

enum WishlistFormStatus { initial, loading, success, failure }

enum ViewedRecentlyStatus { initial, loading, success, failure }

enum ViewedRecentlyFormStatus { initial, loading, success, failure }

enum SearchProductStatus { initial, loading, success, failure }
