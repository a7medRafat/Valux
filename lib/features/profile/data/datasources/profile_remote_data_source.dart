import 'package:valux/features/profile/data/models/ChangePasswordModel.dart';
import 'package:valux/features/profile/data/models/GetProfileModel.dart';

import '../../../../core/API/api_services.dart';
import '../models/UpdateProfileModel.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateProfileModel> updateUser({required Map<String, dynamic> map});

  Future<ChangePasswordModel> changePass({required Map<String, dynamic> map});

  Future<GetProfileModel> getProfileData({required String token});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;


  ProfileRemoteDataSourceImpl(
      {required this.apiService});

  @override
  Future<UpdateProfileModel> updateUser(
      {required Map<String, dynamic> map}) async {
    return await apiService.updateUser(map: map);
  }

  @override
  Future<ChangePasswordModel> changePass(
      {required Map<String, dynamic> map}) async {
    return await apiService.changePss(map: map);
  }

  @override
  Future<GetProfileModel> getProfileData({required String token}) async {
    return await apiService.getProfileData(token: token);
  }
}
