import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class OrderService {
  final FirebaseFirestore firestore;

  OrderService({
    required this.firestore,
  });

  Future<QuerySnapshot> fetchOrderItems(String userId) async {
    try {
      final QuerySnapshot orderItemQuery = await firestore
          .collection(kOrdersCollectionPath)
          .where(kUser, isEqualTo: userId)
          .get();

      return orderItemQuery;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<DocumentSnapshot> placeOrder(OrderItem orderItem) async {
    try {
      final DocumentReference orderItemRef = await firestore
          .collection(kOrdersCollectionPath)
          .add(orderItem.toMap());

      final DocumentSnapshot orderItemDoc = await orderItemRef.get();

      if (!orderItemDoc.exists) {
        throw GCRError.exception('Order item does not exist');
      }

      return orderItemDoc;
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
