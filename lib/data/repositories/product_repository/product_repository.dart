import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/services.dart';
import '../../models/models.dart';
import './base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final ProductService productService;

  ProductRepository({
    required this.productService,
  });

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final List<DocumentSnapshot> productDocs =
          await productService.fetchProducts();

      return productDocs.map((doc) => Product.fromDoc(doc)).toList();
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> searchProducts(String keywords) async {
    try {
      final List<DocumentSnapshot> productDocs =
          await productService.searchProducts(keywords);

      return productDocs.map((doc) => Product.fromDoc(doc)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
