import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import './models.dart';
import '../../utils/utils.dart';

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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    final DocumentReference<Map<String, dynamic>> productRef = FirebaseFirestore
        .instance
        .collection(kProductsCollectionPath)
        .doc(product.id);

    result.addAll({'product': productRef});
    result.addAll({'quantity': quantity});
    result.addAll({'userId': userId});
    result.addAll({'dateCreated': dateCreated.millisecondsSinceEpoch});

    return result;
  }

  factory CartItem.fromMap(
    DocumentSnapshot doc, {
    required Product product,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return CartItem(
      id: doc.id,
      product: product,
      quantity: map['quantity']?.toInt() ?? 0,
      userId: map['userId'] ?? '',
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
    );
  }

  static List<CartItem> cartItems = [
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[9],
      quantity: 2,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[0],
      quantity: 1,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[7],
      quantity: 4,
      userId: 'cromuel-unique-id',
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[8],
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
      product: Product.productList[11],
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
