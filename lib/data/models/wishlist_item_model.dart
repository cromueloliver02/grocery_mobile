import 'package:equatable/equatable.dart';

import 'models.dart';

class WishlistItem extends Equatable {
  final String id;
  final Product product;
  final DateTime createdAt;

  WishlistItem({
    required this.id,
    required this.product,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  List<Object> get props => [id, product, createdAt];

  @override
  String toString() =>
      'WishlistItem(id: $id, product: $product, createdAt: $createdAt)';

  WishlistItem copyWith({
    String Function()? id,
    Product Function()? product,
    DateTime Function()? createdAt,
  }) {
    return WishlistItem(
      id: id != null ? id() : this.id,
      product: product != null ? product() : this.product,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'product': product.id});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory WishlistItem.fromMap(
    Map<String, dynamic> map, {
    required Product product,
  }) {
    return WishlistItem(
      id: map['id'] ?? '',
      product: product,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
