import 'package:dartz/dartz.dart';
import 'package:valux/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/CartModel.dart';

class GetCartsUseCase {
  final CartRepository cartRepository;

  GetCartsUseCase({required this.cartRepository});

  Future<Either<Failure, CartModel>> call() async {
    return await cartRepository.getCarts();
  }
}
