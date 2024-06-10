import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/ChangePasswordModel.dart';
import '../../data/models/GetProfileModel.dart';
import '../../data/models/UpdateProfileModel.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UpdateProfileModel>> updateUser(
      {required Map<String, dynamic> map});

  Future<Either<Failure, ChangePasswordModel>> changePass(
      {required Map<String, dynamic> map});

  Future<Either<Failure, GetProfileModel>> getProfileData(
      {required String token});

}
