import 'package:dartz/dartz.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import 'package:valux/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error_handeller/failures.dart';
import '../../data/models/RegisterModel.dart';

class UserRegisterUseCase {
  final AuthRepository authRepository;

  UserRegisterUseCase({required this.authRepository});

  Future<Either<Failure, RegisterModel>> call(
      {required RegisterBody body}) async {
    return await authRepository.userRegister(body: body);
  }
}
