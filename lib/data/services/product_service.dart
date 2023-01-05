import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class ProductService {
  final FirebaseFirestore firestore;

  ProductService({
    required this.firestore,
  });

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
}
