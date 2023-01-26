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
      final Stream<QuerySnapshot> productQueryStream =
          productService.fetchProducts();

      final Stream<List<Product>> productListStream =
          productQueryStream.map((snapshot) {
        return snapshot.docs.map((QueryDocumentSnapshot productDoc) {
          return Product.fromDoc(productDoc);
        }).toList();
      });

      return productListStream;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> searchProducts(String keywords) async {
    try {
      final QuerySnapshot productQuery =
          await productService.searchProducts(keywords);
      final List<DocumentSnapshot> productDocs = productQuery.docs;
      final List<Product> products =
          productDocs.map((doc) => Product.fromDoc(doc)).toList();

      return products;
    } catch (err) {
      rethrow;
    }
  }
}
