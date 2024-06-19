import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/TestOrder.dart';

abstract class OrderRepository {
  Future<Either<Failure, DocumentReference>> makeOrder(
      {required OrderModel order});

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getMyOrders();
}
