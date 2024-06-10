import 'package:valux/core/API/api_services.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';

abstract class FavouritesRemoteDataSource {
  Future<FavModel> getFavourites();
}

class FavouritesRemoteDataSourceImpl extends FavouritesRemoteDataSource {
  FavouritesRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<FavModel> getFavourites() async {
    return await apiService.getFavourites();
  }
}
