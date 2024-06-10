import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/CartModel.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getCarts();
}
