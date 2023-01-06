import 'package:keyboard_dismisser/keyboard_dismisser.dart';

// FIREBASE DOCUMENT PATHS
const String kUsersCollectionPath = 'users';
const String kProductsCollectionPath = 'products';
const String kCartItemsCollectionPath = 'cart-items';

const List<String> kBannerImages = [
  'assets/images/offers/Offer1.jpg',
  'assets/images/offers/Offer2.jpg',
  'assets/images/offers/Offer3.jpg',
  'assets/images/offers/Offer4.jpg',
];

const List<String> kAuthImagesPaths = [
  'assets/images/landing/buy-on-laptop.jpg',
  'assets/images/landing/buy-through.png',
  'assets/images/landing/buyfood.jpg',
  'assets/images/landing/grocery-cart.jpg',
  'assets/images/landing/store.jpg',
  'assets/images/landing/vegetable.jpg',
];

const List<GestureType> kDismissKeyboardGestures = [
  GestureType.onTap,
  GestureType.onPanUpdateDownDirection,
];

// FIREBASE AUTH CODES
const String kEmailAlreadyInUse = 'email-already-in-use';
const String kWrongPassword = 'wrong-password';
const String kUserNotFound = 'user-not-found';
