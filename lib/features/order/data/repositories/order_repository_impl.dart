import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/order/data/datasources/order_remote_data_source.dart';
import 'package:valux/features/order/domain/repositories/order_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../models/TestOrder.dart';

class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  final OrderRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, DocumentReference<Object?>>> makeOrder(
      {required OrderModel order}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.makeOrder(order: order);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      } on FirebaseException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getMyOrders()async {
    if (await networkInfo.isConnected) {
      try {
        final snapShot = await remoteDataSource.getMyOrders();
        return right(snapShot);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      } on FirebaseException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
