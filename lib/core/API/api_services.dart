import 'package:valux/core/dio_helper/dio_helper.dart';
import 'package:valux/core/end_points/end_points.dart';
import 'package:valux/core/error_handeller/exceptions.dart';
import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import 'package:valux/features/cart/data/models/AddToCartModel.dart';
import 'package:valux/features/cart/data/models/CartModel.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import 'package:valux/features/profile/data/models/UpdateProfileModel.dart';
import '../../App/injuctoin_container.dart';
import '../../features/address/data/models/GetAddresses.dart';
import '../../features/auth/data/models/RegisterModel.dart';
import '../../features/layout/cubit/home/home_cubit.dart';
import '../../features/profile/data/models/ChangePasswordModel.dart';
import '../../features/profile/data/models/GetProfileModel.dart';
import '../../features/search/data/models/SearchModel.dart';
import '../local_storage/hive_keys.dart';
import '../local_storage/user_storage.dart';
import '../shared_preferances/cache_helper.dart';

abstract class ApiService {
  Future<LoginModel> userLogin(
      {required String email, required String password});

  Future<RegisterModel> userRegister({required RegisterBody registerBody});

  Future<HomeModel> getHomeData();

  Future<CategoriesModel> getCategories();

  Future<ProductModel> getCategoryProduct({required int categoryId});

  Future<FavModel> addDeleteFav({required int productId});

  Future<FavModel> getFavourites();

  Future<SearchModel> search({required String text});

  Future<AddToCartModel> addDeleteToCart({required int productId});

  Future<CartModel> getCarts();

  Future<UpdateProfileModel> updateUser({required Map<String, dynamic> map});

  Future<GetProfileModel> getProfileData({required String token});

  Future<ChangePasswordModel> changePss({required Map<String, dynamic> map});

  Future<GetAddresses> getAddresses();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<LoginModel> userLogin(
      {required String email, required String password}) async {
    final response = await DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      LoginModel model = LoginModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RegisterModel> userRegister(
      {required RegisterBody registerBody}) async {
    final response = await DioHelper.postData(
        url: EndPoints.REGISTER, data: registerBody.toJson());
    if (response.statusCode == 200) {
      RegisterModel model = RegisterModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.getData(
        url: EndPoints.HOME, token: CacheHelper.getData(key: 'token'));
    if (response.statusCode == 200) {
      HomeModel model = HomeModel.fromJson(response.data);
      for (var e in model.data!.products!) {
        sl<HomeCubit>().favourites.addAll({e.id!: e.inFavorites!});
        sl<DetailsCubit>().inCart.addAll({e.id!: e.inCart!});
      }
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoriesModel> getCategories() async {
    final response = await DioHelper.getData(
        url: EndPoints.CATEGORIES, token: CacheHelper.getData(key: 'token'));
    if (response.statusCode == 200) {
      CategoriesModel model = CategoriesModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FavModel> addDeleteFav({required int productId}) async {
    try {
      final response = await DioHelper.postData(
          url: EndPoints.FAVOURITES,
          token: CacheHelper.getData(key: 'token'),
          data: {'product_id': productId});
      if (response.statusCode == 200) {
        FavModel model = FavModel.fromJson(response.data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> getCategoryProduct({required int categoryId}) async {
    final response = await DioHelper.getData(
        url: EndPoints.PRODUCTS,
        token: CacheHelper.getData(key: 'token'),
        query: {'category_id': categoryId});
    if (response.statusCode == 200) {
      ProductModel model = ProductModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FavModel> getFavourites() async {
    final response = await DioHelper.getData(
        url: EndPoints.FAVOURITES, token: CacheHelper.getData(key: 'token'));
    if (response.statusCode == 200) {
      FavModel model = FavModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchModel> search({required String text}) async {
    final response = await DioHelper.postData(
        url: EndPoints.SEARCH,
        token: CacheHelper.getData(key: 'token'),
        data: {'text': text});
    if (response.statusCode == 200) {
      SearchModel model = SearchModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AddToCartModel> addDeleteToCart({required int productId}) async {
    final response = await DioHelper.postData(
        url: EndPoints.CARTS,
        data: {'product_id': productId},
        token: CacheHelper.getData(key: 'token'));
    if (response.statusCode == 200) {
      AddToCartModel model = AddToCartModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartModel> getCarts() async {
    final response = await DioHelper.getData(
        url: EndPoints.CARTS, token: CacheHelper.getData(key: 'token'));
    if (response.statusCode == 200) {
      CartModel model = CartModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UpdateProfileModel> updateUser(
      {required Map<String, dynamic> map}) async {
    final response = await DioHelper.putData(
      url: EndPoints.UPDATE_PROFILE,
      data: map,
      token: CacheHelper.getData(key: 'token'),
    );
    if (response.statusCode == 200) {
      UpdateProfileModel model = UpdateProfileModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ChangePasswordModel> changePss(
      {required Map<String, dynamic> map}) async {
    final response = await DioHelper.postData(
      url: EndPoints.CHANGE_PASS,
      data: map,
      token: CacheHelper.getData(key: 'token'),
    );
    if (response.statusCode == 200) {
      ChangePasswordModel model = ChangePasswordModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetProfileModel> getProfileData({required String token}) async {
    final response = await DioHelper.getData(
      url: EndPoints.PROFILE,
      token: token,
    );

    if (response.statusCode == 200) {
      GetProfileModel profileModel = GetProfileModel.fromJson(response.data);
      return profileModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetAddresses> getAddresses() async {
    final response = await DioHelper.getData(
      url: EndPoints.ADDRESS,
      token: UserData().getData(id: Keys.user)!.token,
    );
    if (response.statusCode == 200) {
      GetAddresses model = GetAddresses.fromJson(response.data);
      return model;
    } else {
      throw Exception();
    }
  }
}
