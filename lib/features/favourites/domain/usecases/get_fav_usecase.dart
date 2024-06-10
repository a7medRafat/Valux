import 'package:dartz/dartz.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/favourites_repository.dart';

class GetFavUseCase {
  final FavouritesRepository favouritesRepository;

  GetFavUseCase({required this.favouritesRepository});

  Future<Either<Failure, FavModel>> call() async {
    return await favouritesRepository.getFavourites();
  }
}
