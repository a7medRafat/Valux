import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import '../../../../core/API/api_services.dart';
import '../models/HomeModel.dart';

abstract class LayoutRemoteDataSource {
  Future<HomeModel> getHomeData();

  Future<CategoriesModel> getCategories();

  Future<ProductModel> getCategoryProduct({required int categoryId});

  Future<FavModel> addDeleteFav({required int productId});
}

class LayoutRemoteDataSourceImpl extends LayoutRemoteDataSource {
  final ApiService apiService;

  LayoutRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeModel> getHomeData() async {
    return await apiService.getHomeData();
  }

  @override
  Future<CategoriesModel> getCategories() async {
    return await apiService.getCategories();
  }

  @override
  Future<FavModel> addDeleteFav({required int productId}) async {
    return await apiService.addDeleteFav(productId: productId);
  }

  @override
  Future<ProductModel> getCategoryProduct({required int categoryId}) async {
    return await apiService.getCategoryProduct(categoryId: categoryId);
  }
}
