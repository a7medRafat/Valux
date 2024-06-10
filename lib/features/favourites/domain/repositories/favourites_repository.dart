import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';

abstract class FavouritesRepository {
  Future<Either<Failure, FavModel>> getFavourites();
}
