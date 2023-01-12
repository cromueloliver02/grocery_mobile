import './models.dart';
import '../../utils/utils.dart';

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
      product: Product.initial(),
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
    String Function()? id,
    Product Function()? product,
    int Function()? quantity,
    String Function()? userId,
    DateTime Function()? createdAt,
  }) {
    return CartItem(
      id: id != null ? id() : this.id,
      product: product != null ? product() : this.product,
      quantity: quantity != null ? quantity() : this.quantity,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'product': product.id});
    result.addAll({'quantity': quantity});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory CartItem.fromMap(
    Map<String, dynamic> map, {
    required Product product,
  }) {
    return CartItem(
      id: map['id'] ?? '',
      product: product,
      quantity: map['quantity']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static List<CartItem> dummyCartItems = [
    CartItem(
      id: uuid.v4(),
      product: Product.productList[9],
      quantity: 2,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[0],
      quantity: 1,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[7],
      quantity: 4,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[8],
      quantity: 3,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[4],
      quantity: 1,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[11],
      quantity: 1,
    ),
    CartItem(
      id: uuid.v4(),
      product: Product.productList[6],
      quantity: 2,
    ),
  ];
}
