import 'package:dartz/dartz.dart';

import '../../../../core/error_handeller/failures.dart';
import '../../../cart/data/models/AddToCartModel.dart';

abstract class DetailsRepository {
  Future<Either<Failure, AddToCartModel>> addDeleteToCart({required int productId});

}
