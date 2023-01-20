import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import './models.dart';
import '../../utils/utils.dart';

class OrderItem extends Equatable {
  final String id;
  final String userId;
  final List<CartItem> cartItems;
  final DateTime createdAt;

  OrderItem({
    required this.id,
    required this.userId,
    required this.cartItems,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  double get grandTotalPrice =>
      cartItems.fold(0.0, (prev, cartItem) => prev + cartItem.totalPrice);

  @override
  List<Object> get props => [id, userId, cartItems, createdAt];

  @override
  String toString() {
    return 'OrderItem(id: $id, userId: $userId, cartItems: $cartItems, createdAt: $createdAt)';
  }

  OrderItem copyWith({
    String Function()? id,
    String Function()? userId,
    List<CartItem> Function()? cartItems,
    DateTime Function()? createdAt,
  }) {
    return OrderItem(
      id: id != null ? id() : this.id,
      userId: userId != null ? userId() : this.userId,
      cartItems: cartItems != null ? cartItems() : this.cartItems,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'cartItems': cartItems.map((x) => x.toMap()).toList()});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory OrderItem.fromDoc(
    DocumentSnapshot doc, {
    required List<CartItem> cartItems,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return OrderItem(
      id: doc.id,
      userId: map['userId'] ?? '',
      cartItems: cartItems,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static final List<OrderItem> dummyOrderItems = [
    OrderItem(
      id: uuid.v4(),
      userId: 'user-id',
      cartItems: [
        CartItem.dummyCartItems[0],
        CartItem.dummyCartItems[1],
        CartItem.dummyCartItems[2],
      ],
    ),
    OrderItem(
      id: uuid.v4(),
      userId: 'user-id',
      cartItems: [
        CartItem.dummyCartItems[6],
        CartItem.dummyCartItems[3],
        CartItem.dummyCartItems[3],
        CartItem.dummyCartItems[5],
      ],
    ),
    OrderItem(
      id: uuid.v4(),
      userId: 'user-id',
      cartItems: [
        CartItem.dummyCartItems[4],
      ],
    ),
  ];
}
