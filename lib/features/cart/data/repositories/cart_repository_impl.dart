import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:valux/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../models/CartModel.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CartModel>> getCarts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getCarts();
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
