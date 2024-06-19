import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:valux/features/order/domain/repositories/order_repository.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/TestOrder.dart';

class MakeOrderUseCase {
  final OrderRepository orderRepository;

  MakeOrderUseCase({required this.orderRepository});

  Future<Either<Failure, DocumentReference>> call(
      {required OrderModel order}) async {
    return await orderRepository.makeOrder(order: order);
  }
}
