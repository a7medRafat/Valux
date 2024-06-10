import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/search/data/datasources/search_remote_data_source.dart';
import 'package:valux/features/search/data/models/SearchModel.dart';
import 'package:valux/features/search/domain/repositories/search_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, SearchModel>> search({required String text}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.search(text: text);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
