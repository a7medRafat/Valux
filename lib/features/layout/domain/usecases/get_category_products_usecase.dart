import 'package:dartz/dartz.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/layout_repository.dart';

class GetCategoryProductUseCase {
  final LayoutRepository layoutRepository;

  GetCategoryProductUseCase({required this.layoutRepository});

  Future<Either<Failure, ProductModel>> call({required int categoryId}) async {
    return await layoutRepository.getCategoryProducts(categoryId: categoryId);
  }
}
