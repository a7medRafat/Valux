import 'package:dartz/dartz.dart';
import 'package:valux/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/error_handeller/failures.dart';
import '../../data/models/UpdateProfileModel.dart';

class UpdateUserUseCase {
  final ProfileRepository profileRepository;

  UpdateUserUseCase({required this.profileRepository});

  Future<Either<Failure, UpdateProfileModel>> call(
      {required Map<String, dynamic> map}) async {
    return await profileRepository.updateUser(map: map);
  }
}
