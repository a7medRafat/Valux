import '../../../../core/API/api_services.dart';
import '../../../cart/data/models/AddToCartModel.dart';

abstract class DetailsRemoteDataSource {
  Future<AddToCartModel> addDeleteToCart({required int productId});
}

class DetailsRemoteDataSourceImpl extends DetailsRemoteDataSource {
  final ApiService apiServices;

  DetailsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddToCartModel> addDeleteToCart({required int productId}) async {
    return await apiServices.addDeleteToCart(productId: productId);
  }
}
