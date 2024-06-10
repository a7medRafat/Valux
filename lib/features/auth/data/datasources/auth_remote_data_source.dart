import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import 'package:valux/features/auth/data/models/RegisterModel.dart';
import '../../../../core/API/api_services.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> userLogin(
      {required String email, required String password});

  Future<RegisterModel> userRegister({required RegisterBody registerBody});

}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<LoginModel> userLogin(
      {required String email, required String password}) async {
    return await apiService.userLogin(email: email, password: password);
  }

  @override
  Future<RegisterModel> userRegister(
      {required RegisterBody registerBody}) async {
    return await apiService.userRegister(registerBody: registerBody);
  }

}
