import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/favourites/data/datasources/favourites_remote_data_source.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/favourites/domain/repositories/favourites_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';

class FavouritesRepositoryImpl extends FavouritesRepository {
  FavouritesRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  final FavouritesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, FavModel>> getFavourites() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getFavourites();
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
