import 'package:dartz/dartz.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/layout_repository.dart';

class AddDeleteFavUseCase {
  final LayoutRepository layoutRepository;

  AddDeleteFavUseCase({required this.layoutRepository});

  Future<Either<Failure, FavModel>> call({required int productId}) async {
    return await layoutRepository.addDDeleteFav(productId: productId);
  }
}
