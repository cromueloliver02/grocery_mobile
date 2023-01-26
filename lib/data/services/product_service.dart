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

      if (!productDoc.exists) {
        throw GCRError.exception('Product does not exist');
      }

      return productDoc;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Stream<QuerySnapshot> fetchProducts() {
    try {
      final Stream<QuerySnapshot> productQueryStream =
          firestore.collection(kProductsCollectionPath).snapshots();

      return productQueryStream;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<QuerySnapshot> searchProducts(String keywords) async {
    try {
      final QuerySnapshot productQuery = await firestore
          .collection(kProductsCollectionPath)
          .where(kName, isGreaterThanOrEqualTo: keywords)
          .where(kName, isLessThanOrEqualTo: '$keywords\uf8ff')
          .get(); // not case-insensitive yet - I'll look for another solution

      return productQuery;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
