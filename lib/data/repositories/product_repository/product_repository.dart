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
  Stream<List<Product>> fetchProducts() {
    try {
      final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
          productSnapshots = productService.fetchProducts();

      return productSnapshots.map((docs) {
        return docs.map((doc) => Product.fromDoc(doc)).toList();
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> searchProducts(String keywords) async {
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> productDocs =
          await productService.searchProducts(keywords);

      return productDocs.map((doc) => Product.fromDoc(doc)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
