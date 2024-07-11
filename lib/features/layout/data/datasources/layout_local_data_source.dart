import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:valux/core/shared_preferances/cache_helper.dart';
import 'package:valux/features/layout/data/models/CatetgoriesModel.dart';

import '../../../../core/error_handeller/exceptions.dart';
import '../models/HomeModel.dart';

abstract class LayoutLocalDataSource {
  Future<HomeModel> getCachedData();

  Future<Unit> cachesHomeData(HomeModel homeModel);

  Future<CategoriesModel> getCachedCategory();

  Future<Unit> cachesCategory(CategoriesModel categoryModel);
}

class LayoutLocalDataSourceImpl extends LayoutLocalDataSource {
  @override
  Future<Unit> cachesHomeData(HomeModel homeModel) {
    String jsonString = jsonEncode(homeModel.toJson());
    CacheHelper.saveData(key: 'HOME_DATA', value: jsonString);
    return Future.value(unit);
  }

  @override
  Future<HomeModel> getCachedData() {
    final jsonString = CacheHelper.getData(key: 'HOME_DATA');
    if (jsonString != null) {
      final decodeJsonData = json.decode(jsonString);
      HomeModel jsonToHomeModel = HomeModel.fromJson(decodeJsonData);
      return Future.value(jsonToHomeModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cachesCategory(CategoriesModel categoryModel) {
    String jsonString = jsonEncode(categoryModel.toJson());
    CacheHelper.saveData(key: 'CATEGORY', value: jsonString);
    return Future.value(unit);
  }

  @override
  Future<CategoriesModel> getCachedCategory() {
    final jsonString = CacheHelper.getData(key: 'CATEGORY');
    if (jsonString != null) {
      final decodeJsonData = json.decode(jsonString);
      CategoriesModel jsonToHomeModel =
          CategoriesModel.fromJson(decodeJsonData);
      return Future.value(jsonToHomeModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
