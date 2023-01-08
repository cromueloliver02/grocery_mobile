import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import './models.dart';

const _uuid = Uuid();

class CartItem {
  final String id;
  final Product product;
  final int quantity;
  final DateTime createdAt;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory CartItem.empty() {
    return CartItem(
      id: '',
      product: Product.empty(),
      quantity: 0,
      createdAt: null,
    );
  }

  double get totalPrice {
    final double currentPrice = product.salePrice ?? product.price;

    return currentPrice * quantity;
  }

  @override
  String toString() {
    return 'CartItem(id: $id, product: $product, quantity: $quantity, createdAt: $createdAt)';
  }

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    String? userId,
    DateTime? createdAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    // final DocumentReference<Map<String, dynamic>> productRef = FirebaseFirestore
    //     .instance
    //     .collection(kProductsCollectionPath)
    //     .doc(product.id);

    result.addAll({'product': product.id});
    result.addAll({'quantity': quantity});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory CartItem.fromDoc(
    DocumentSnapshot doc, {
    required Product product,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return CartItem(
      id: doc.id,
      product: product,
      quantity: map['quantity']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static List<CartItem> dummyCartItems = [
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[9],
      quantity: 2,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[0],
      quantity: 1,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[7],
      quantity: 4,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[8],
      quantity: 3,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[4],
      quantity: 1,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[11],
      quantity: 1,
    ),
    CartItem(
      id: _uuid.v4(),
      product: Product.productList[6],
      quantity: 2,
    ),
  ];
}
