import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/firebase/firestore.dart';
import '../models/TestOrder.dart';

abstract class OrderRemoteDataSource {
  Future<DocumentReference> makeOrder({required OrderModel order});

  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders();
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final MyFirebase myFirebase;

  OrderRemoteDataSourceImpl({required this.myFirebase});

  @override
  Future<DocumentReference<Object?>> makeOrder(
      {required OrderModel order}) async {
    return await myFirebase.makeOrder(order: order);
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders() async {
    return await myFirebase.getMyOrders();
  }
}
