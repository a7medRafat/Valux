import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/cart/data/models/AddToCartModel.dart';
import 'package:valux/features/details/data/datasources/details_remote_data_source.dart';
import 'package:valux/features/details/domain/repositories/details_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';

class DetailsRepositoryImpl extends DetailsRepository {
  final DetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DetailsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, AddToCartModel>> addDeleteToCart(
      {required int productId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.addDeleteToCart(productId: productId);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
