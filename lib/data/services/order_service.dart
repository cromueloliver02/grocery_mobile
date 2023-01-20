import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class OrderService {
  final FirebaseFirestore firestore;

  OrderService({
    required this.firestore,
  });

  Future<QuerySnapshot> fetchOrders(String userId) async {
    try {
      final QuerySnapshot orderQuery = await firestore
          .collection(kOrdersCollectionPath)
          .where('userId', isEqualTo: userId)
          .get();

      return orderQuery;
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

      return orderItemDoc;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
