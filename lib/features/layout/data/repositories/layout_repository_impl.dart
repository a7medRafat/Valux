import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import 'package:valux/features/layout/domain/repositories/layout_repository.dart';
import '../../../../core/error_handeller/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/layout_local_data_source.dart';
import '../datasources/layout_remote_data_source.dart';

class LayoutRepositoryImpl extends LayoutRepository {
  final LayoutRemoteDataSource remoteDataSource;
  final LayoutLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LayoutRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getHomeData();
        await localDataSource.cachesHomeData(response);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      try {
        final localData = await localDataSource.getCachedData();
        return Right(localData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getCategories();
        await localDataSource.cachesCategory(response);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      try {
        final localData = await localDataSource.getCachedCategory();
        return Right(localData);
      } on EmptyCacheException {
        return left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, FavModel>> addDDeleteFav(
      {required int productId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.addDeleteFav(productId: productId);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getCategoryProducts(
      {required categoryId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.getCategoryProduct(categoryId: categoryId);
        return right(response);
      } on ServerException catch (e) {
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

// @override
// Future<Either<Failure, CurrentUserModel>> getCurrentUser(
//     {required String uid}) async {
//   if (await networkInfo.isConnected) {
//     try {
//       final response = await remoteDataSource.getCurrentUser(uid: uid);
//       CurrentUser().saveData(id: HiveKeys.user, data: response);
//       return right(response);
//     } on FirebaseException catch (e) {
//       print(e.code);
//       return left(ServerFailure(error: e));
//     }
//   } else {
//     try {
//       final localData = CurrentUser().getData(id: HiveKeys.user);
//       return right(localData!);
//     } on EmptyCacheException {
//       return left(EmptyCacheFailure());
//     }
//   }
// }
}
