import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:uuid/uuid.dart';

// FIREBASE FIRESTORE DOCUMENT PATHS
const String kUsersCollectionPath = 'users';
const String kProductsCollectionPath = 'products';
const String kCartsCollectionPath = 'carts';
const String kOrdersCollectionPath = 'orders';

// FIREBASE FIRESTORE DOCUMENT PROPERTIES
const String kId = 'id';
const String kName = 'name';
const String kCartItems = 'cartItems';
const String kWishlist = 'wishlist';
const String kProduct = 'product';
const String kQuantity = 'quantity';
const String kShipAddress = 'shipAddress';

const String googleSigninMethod = 'google.com';

const Uuid uuid = Uuid();

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
