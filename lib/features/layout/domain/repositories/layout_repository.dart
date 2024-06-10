import 'package:dartz/dartz.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import '../../../../core/error_handeller/failures.dart';

abstract class LayoutRepository {
  Future<Either<Failure, HomeModel>> getHomeData();

  Future<Either<Failure, CategoriesModel>> getCategories();

  Future<Either<Failure, ProductModel>> getCategoryProducts(
      {required categoryId});

  Future<Either<Failure, FavModel>> addDDeleteFav({required int productId});

}
