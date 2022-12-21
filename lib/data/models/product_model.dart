import '../../presentation/utils/utils.dart';

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
    this.salePrice,
    required this.measureUnit,
  });
}
