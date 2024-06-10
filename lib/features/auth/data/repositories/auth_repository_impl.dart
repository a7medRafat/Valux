import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import 'package:valux/features/auth/data/models/RegisterModel.dart';
import 'package:valux/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.userLogin(email: email, password: password);
        if (response.status == true) {
          CacheHelper.saveData(key: 'token', value: response.data!.token);
        }
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> userRegister(
      {required RegisterBody body}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.userRegister(registerBody: body);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}
