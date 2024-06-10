import 'package:dartz/dartz.dart';
import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/error_handeller/failures.dart';

class UserLoginUseCase {
  final AuthRepository authRepository;

  UserLoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginModel>> call(
      {required String email, required String password}) async {
    return await authRepository.userLogin(email: email, password: password);
  }
}
