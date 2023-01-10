import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class ProductService {
  final FirebaseFirestore firestore;

  ProductService({
    required this.firestore,
  });

  Future<DocumentSnapshot> getProduct(String productId) async {
    try {
      final DocumentSnapshot productDoc = await firestore
          .collection(kProductsCollectionPath)
          .doc(productId)
          .get();

      return productDoc;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<List<DocumentSnapshot>> fetchProducts() async {
    try {
      final QuerySnapshot productSnap =
          await firestore.collection(kProductsCollectionPath).get();

      return productSnap.docs;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<List<DocumentSnapshot>> searchProducts(
    String keywords,
  ) async {
    try {
      final QuerySnapshot productSnap = await firestore
          .collection(kProductsCollectionPath)
          .where('name', isGreaterThanOrEqualTo: keywords)
          .where('name', isLessThanOrEqualTo: '$keywords\uf8ff')
          .get(); // not case-insensitive yet - I'll look for another solution

      return productSnap.docs;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
