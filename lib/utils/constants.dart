import 'package:keyboard_dismisser/keyboard_dismisser.dart';

// FIREBASE DOCUMENT PATHS
const String userCollectionPath = 'users';

const List<String> bannerImages = [
  'assets/images/offers/Offer1.jpg',
  'assets/images/offers/Offer2.jpg',
  'assets/images/offers/Offer3.jpg',
  'assets/images/offers/Offer4.jpg',
];

const List<String> authImagesPaths = [
  'assets/images/landing/buy-on-laptop.jpg',
  'assets/images/landing/buy-through.png',
  'assets/images/landing/buyfood.jpg',
  'assets/images/landing/grocery-cart.jpg',
  'assets/images/landing/store.jpg',
  'assets/images/landing/vegetable.jpg',
];

const List<GestureType> dismissKeyboardGestures = [
  GestureType.onTap,
  GestureType.onPanUpdateDownDirection,
];

// FIREBASE AUTH CODES
const String kEmailAlreadyInUse = 'email-already-in-use';
