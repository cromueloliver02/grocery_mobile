import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../utils/utils.dart';

const _uuid = Uuid();

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final double? salePrice;
  final MeasureUnit measureUnit;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.salePrice,
    required this.measureUnit,
  });

  bool get isOnSale => salePrice != null;

  factory Product.fromDoc(QueryDocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;

    return Product(
      id: doc.id,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      salePrice: map['salePrice']?.toDouble(),
      measureUnit:
          MeasureUnit.values.firstWhere((d) => d.name == map['measureUnit']),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, category: $category, price: $price, salePrice: $salePrice, measureUnit: $measureUnit)';
  }

  static final List<Product> productList = [
    Product(
      id: _uuid.v4(),
      name: 'Apricot',
      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
      category: 'Fruits',
      price: 0.99,
      salePrice: 0.49,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Avocado',
      imageUrl: 'https://i.ibb.co/9VKXw5L/Avocat.png',
      category: 'Fruits',
      price: 0.88,
      salePrice: null,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Black grapes',
      imageUrl: 'https://i.ibb.co/c6w5zrC/Black-Grapes-PNG-Photos.png',
      category: 'Fruits',
      price: 1.22,
      salePrice: 0.7,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Fresh green grape',
      imageUrl: 'https://i.ibb.co/HKx2bsp/Fresh-green-grape.png',
      category: 'Fruits',
      price: 1.5,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Green grape',
      imageUrl: 'https://i.ibb.co/bHKtc33/grape-green.png',
      category: 'Fruits',
      price: 0.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Red apple',
      imageUrl: 'https://i.ibb.co/crwwSG2/red-apple.png',
      category: 'Fruits',
      price: 0.6,
      salePrice: null,
      measureUnit: MeasureUnit.piece,
    ),
    // Vegi
    Product(
      id: _uuid.v4(),
      name: 'Carottes',
      imageUrl: 'https://i.ibb.co/TRbNL3c/Carottes.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.5,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Cauliflower',
      imageUrl: 'https://i.ibb.co/xGWf2rH/Cauliflower.png',
      category: 'Vegetables',
      price: 1.99,
      salePrice: 0.99,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Cucumber',
      imageUrl: 'https://i.ibb.co/kDL5GKg/cucumbers.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.5,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Jalapeno',
      imageUrl: 'https://i.ibb.co/Dtk1YP8/Jalape-o.png',
      category: 'Vegetables',
      price: 1.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Long yam',
      imageUrl: 'https://i.ibb.co/V3MbcST/Long-yam.png',
      category: 'Vegetables',
      price: 2.99,
      salePrice: 1.59,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Onions',
      imageUrl: 'https://i.ibb.co/GFvm1Zd/Onions.png',
      category: 'Vegetables',
      price: 0.59,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Plantain-flower',
      imageUrl: 'https://i.ibb.co/RBdq0PD/Plantain-flower.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.389,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Potato',
      imageUrl: 'https://i.ibb.co/wRgtW55/Potato.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.59,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Radish',
      imageUrl: 'https://i.ibb.co/YcN4ZsD/Radish.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.79,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Red peppers',
      imageUrl: 'https://i.ibb.co/JthGdkh/Red-peppers.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: 0.57,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Squash',
      imageUrl: 'https://i.ibb.co/p1V8sq9/Squash.png',
      category: 'Vegetables',
      price: 3.99,
      salePrice: 2.99,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Tomatoes',
      imageUrl: 'https://i.ibb.co/PcP9xfK/Tomatoes.png',
      category: 'Vegetables',
      price: 0.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    // Grains
    Product(
      id: _uuid.v4(),
      name: 'Corn-cobs',
      imageUrl: 'https://i.ibb.co/8PhwVYZ/corn-cobs.png',
      category: 'Grains',
      price: 0.29,
      salePrice: 0.19,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Peas',
      imageUrl: 'https://i.ibb.co/7GHM7Dp/peas.png',
      category: 'Grains',
      price: 0.99,
      salePrice: 0.49,
      measureUnit: MeasureUnit.kg,
    ),
    // Herbs
    Product(
      id: _uuid.v4(),
      name: 'Asparagus',
      imageUrl: 'https://i.ibb.co/RYRvx3W/Asparagus.png',
      category: 'Herbs',
      price: 6.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Broccoli',
      imageUrl: 'https://i.ibb.co/KXTtrYB/Brokoli.png',
      category: 'Herbs',
      price: 0.99,
      salePrice: 0.89,
      measureUnit: MeasureUnit.piece,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Buk-choy',
      imageUrl: 'https://i.ibb.co/MNDxNnm/Buk-choy.png',
      category: 'Herbs',
      price: 1.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Chinese-cabbage-wombok',
      imageUrl: 'https://i.ibb.co/7yzjHVy/Chinese-cabbage-wombok.png',
      category: 'Herbs',
      price: 0.99,
      salePrice: 0.5,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Kangkong',
      imageUrl: 'https://i.ibb.co/HDSrR2Y/Kangkong.png',
      category: 'Herbs',
      price: 0.99,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Leek',
      imageUrl: 'https://i.ibb.co/Pwhqkh6/Leek.png',
      category: 'Herbs',
      price: 0.99,
      salePrice: 0.5,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Spinach',
      imageUrl: 'https://i.ibb.co/bbjvgcD/Spinach.png',
      category: 'Herbs',
      price: 0.89,
      salePrice: null,
      measureUnit: MeasureUnit.kg,
    ),
    Product(
      id: _uuid.v4(),
      name: 'Almond',
      imageUrl: 'https://i.ibb.co/c8QtSr2/almand.jpg',
      category: 'Nuts',
      price: 8.99,
      salePrice: 6.5,
      measureUnit: MeasureUnit.piece,
    ),
  ];
}
