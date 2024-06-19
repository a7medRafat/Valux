import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/order_repository.dart';

class GetMyOrdersUseCase {
  final OrderRepository orderRepository;

  GetMyOrdersUseCase({required this.orderRepository});

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> call() async {
    return await orderRepository.getMyOrders();
  }
}
