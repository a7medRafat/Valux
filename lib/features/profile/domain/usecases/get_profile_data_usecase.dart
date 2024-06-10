import 'package:dartz/dartz.dart';
import 'package:valux/features/profile/domain/repositories/profile_repository.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/GetProfileModel.dart';

class GetProfileDataUseCase {
  final ProfileRepository profileRepository;

  GetProfileDataUseCase({required this.profileRepository});

  Future<Either<Failure, GetProfileModel>> call({required String token}) async {
    return await profileRepository.getProfileData(token: token);
  }
}
