import '../../../../core/API/api_services.dart';
import '../models/CartModel.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCarts();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CartModel> getCarts() async {
    return await apiService.getCarts();
  }
}
