import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class OrderService {
  final FirebaseFirestore firestore;

  OrderService({
    required this.firestore,
  });

  Stream<QuerySnapshot> fetchOrderItems(String userId) {
    try {
      final Stream<QuerySnapshot> orderItemsQueryStream = firestore
          .collection(kOrdersCollectionPath)
          .where(kUser, isEqualTo: userId)
          .snapshots();

      return orderItemsQueryStream;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> placeOrder(OrderItem orderItem) async {
    try {
      final DocumentReference orderItemRef = await firestore
          .collection(kOrdersCollectionPath)
          .add(orderItem.toMap());

      final DocumentSnapshot orderItemDoc = await orderItemRef.get();

      if (!orderItemDoc.exists) {
        throw GCRError.exception('Order item does not exist');
      }
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
