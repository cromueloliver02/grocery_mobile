import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';
import './models.dart';

class OrderItem extends Equatable {
  final String id;
  final List<CartItem> cartItems;
  final User user;
  final DateTime createdAt;

  OrderItem({
    required this.id,
    required this.cartItems,
    required this.user,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  double get grandTotalPrice =>
      cartItems.fold(0.0, (prev, cartItem) => prev + cartItem.totalPrice);

  @override
  List<Object> get props => [id, cartItems, user, createdAt];

  @override
  String toString() {
    return 'OrderItem(id: $id, cartItems: $cartItems, user: $user, createdAt: $createdAt)';
  }

  OrderItem copyWith({
    String Function()? id,
    List<CartItem> Function()? cartItems,
    User Function()? user,
    DateTime Function()? createdAt,
  }) {
    return OrderItem(
      id: id != null ? id() : this.id,
      cartItems: cartItems != null ? cartItems() : this.cartItems,
      user: user != null ? user() : this.user,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cartItems': cartItems.map((x) => x.toMap()).toList()});
    result.addAll({'user': user.id});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory OrderItem.fromDoc(
    DocumentSnapshot doc, {
    required List<CartItem> cartItems,
    required User user,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return OrderItem(
      id: doc.id,
      cartItems: cartItems,
      user: user,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static final List<OrderItem> dummyOrderItems = [
    OrderItem(
      id: uuid.v4(),
      cartItems: [
        CartItem.dummyCartItems[0],
        CartItem.dummyCartItems[1],
        CartItem.dummyCartItems[2],
      ],
      user: User.initial(),
    ),
    OrderItem(
      id: uuid.v4(),
      cartItems: [
        CartItem.dummyCartItems[6],
        CartItem.dummyCartItems[3],
        CartItem.dummyCartItems[3],
        CartItem.dummyCartItems[5],
      ],
      user: User.initial(),
    ),
    OrderItem(
      id: uuid.v4(),
      cartItems: [
        CartItem.dummyCartItems[4],
      ],
      user: User.initial(),
    ),
  ];
}
