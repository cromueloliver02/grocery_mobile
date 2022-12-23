import 'package:uuid/uuid.dart';

import './models.dart';

const _uuid = Uuid();

class CartItem {
  final String id;
  final Product product;
  final int quantity;
  final String userId;
  final DateTime dateCreated;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.userId,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  double get totalPrice {
    final double currentPrice = product.salePrice ?? product.price;

    return currentPrice * quantity;
  }

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    String? userId,
    DateTime? dateCreated,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      userId: userId ?? this.userId,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  static List<CartItem> cartItems = [
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[0],
      quantity: 2,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[1],
      quantity: 1,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[2],
      quantity: 4,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[3],
      quantity: 3,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[4],
      quantity: 1,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[5],
      quantity: 1,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[6],
      quantity: 2,
      userId: 'cromuel-unique-id',
    ),
  ];
}
