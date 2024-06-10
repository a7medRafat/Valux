import 'package:dartz/dartz.dart';
import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/RegisterModel.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password});

  Future<Either<Failure, RegisterModel>> userRegister(
      {required RegisterBody body});

}
