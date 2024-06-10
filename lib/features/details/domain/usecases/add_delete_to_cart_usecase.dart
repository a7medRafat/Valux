import 'package:dartz/dartz.dart';
import 'package:valux/features/cart/data/models/AddToCartModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/details_repository.dart';

class AddDeleteToCartUseCase {
  final DetailsRepository detailsRepository;

  AddDeleteToCartUseCase({required this.detailsRepository});

  Future<Either<Failure, AddToCartModel>> call({required int productId}) async {
    return await detailsRepository.addDeleteToCart(productId: productId);
  }
}
