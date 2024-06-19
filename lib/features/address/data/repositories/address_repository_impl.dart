import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/address/data/datasources/address_remote_data_source.dart';
import 'package:valux/features/address/data/models/GetAddresses.dart';
import 'package:valux/features/address/domain/repositories/address_repository.dart';

import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddressRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, GetAddresses>> getAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getAddresses();
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
