import 'package:dartz/dartz.dart';
import 'package:valux/features/profile/data/models/ChangePasswordModel.dart';
import 'package:valux/features/profile/domain/repositories/profile_repository.dart';
import '../../../../core/error_handeller/failures.dart';

class ChangePassUseCase {
  final ProfileRepository profileRepository;

  ChangePassUseCase({required this.profileRepository});

  Future<Either<Failure, ChangePasswordModel>> call(
      {required Map<String, dynamic> map}) async {
    return await profileRepository.changePass(map: map);
  }
}
