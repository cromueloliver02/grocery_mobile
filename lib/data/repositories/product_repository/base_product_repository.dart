import '../../models/models.dart';

abstract class BaseProductRepository {
  Future<List<Product>> fetchProducts();

  Future<List<Product>> searchProducts(String keywords);
}
