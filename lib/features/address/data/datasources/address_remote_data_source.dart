import 'package:valux/core/API/api_services.dart';

import '../models/GetAddresses.dart';

abstract class AddressRemoteDataSource {
  Future<GetAddresses> getAddresses();
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  final ApiService apiService;

  AddressRemoteDataSourceImpl({required this.apiService});

  @override
  Future<GetAddresses> getAddresses() async {
    return await apiService.getAddresses();
  }
}
