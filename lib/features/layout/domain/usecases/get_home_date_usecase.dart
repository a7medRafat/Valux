import 'package:dartz/dartz.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';

import '../../../../core/error_handeller/failures.dart';
import '../repositories/layout_repository.dart';

class GetHomeDataUseCase {
  final LayoutRepository layoutRepository;

  GetHomeDataUseCase({required this.layoutRepository});

  Future<Either<Failure, HomeModel>> call() async {
    return await layoutRepository.getHomeData();
  }
}
