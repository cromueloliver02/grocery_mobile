import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class ProductService {
  final FirebaseFirestore firestore;

  ProductService({
    required this.firestore,
  });

  Future<DocumentSnapshot> getProductById(String productId) async {
    try {
      return await firestore
          .collection(kProductsCollectionPath)
          .doc(productId)
          .get();
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

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchProducts() {
    try {
      return firestore
          .collection(kProductsCollectionPath)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs;
      });
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

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchProducts(
    String keywords,
  ) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection(kProductsCollectionPath)
          .where('name', isGreaterThanOrEqualTo: keywords)
          .where('name', isLessThanOrEqualTo: '$keywords\uf8ff')
          .get(); // not case-insensitive yet - I'll look for another solution

      return querySnapshot.docs;
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
