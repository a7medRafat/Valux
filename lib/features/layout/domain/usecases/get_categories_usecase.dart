import 'package:dartz/dartz.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/layout_repository.dart';

class GetCategoriesUseCase {
  final LayoutRepository layoutRepository;

  GetCategoriesUseCase({required this.layoutRepository});

  Future<Either<Failure, CategoriesModel>> call() async {
    return await layoutRepository.getCategories();
  }
}
