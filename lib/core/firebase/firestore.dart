import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valux/core/Collections/collections.dart';
import '../../features/order/data/models/TestOrder.dart';

abstract class MyFirebase {
  Future<DocumentReference> makeOrder({required OrderModel order});

  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders();
}

class MyFirebaseImpl implements MyFirebase {
  @override
  Future<DocumentReference<Object?>> makeOrder(
      {required OrderModel order}) async {
    final response = await Collections.orders.add(order.toJson());
    return response;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders() async {
    final res = await Collections.orders.get();
    return res;
  }
}
