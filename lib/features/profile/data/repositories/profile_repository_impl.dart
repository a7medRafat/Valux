
import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:valux/features/profile/data/models/ChangePasswordModel.dart';
import 'package:valux/features/profile/data/models/GetProfileModel.dart';
import 'package:valux/features/profile/data/models/UpdateProfileModel.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/local_storage/hive_keys.dart';
import '../../../../core/local_storage/user_storage.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, UpdateProfileModel>> updateUser(
      {required Map<String, dynamic> map}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateUser(map: map);
        getProfileData(token: response.data!.token!);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ChangePasswordModel>> changePass(
      {required Map<String, dynamic> map}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.changePass(map: map);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, GetProfileModel>> getProfileData({required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getProfileData(token: token);
        if (response.status == true) {
          UserData().saveData(id: Keys.user, data: response.data!);
          return right(response);
        } else {
          throw ServerException();
        }
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

}
