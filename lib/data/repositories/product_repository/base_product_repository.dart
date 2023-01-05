import '../../models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> fetchProducts();

  Future<List<Product>> searchProducts(String keywords);
}
