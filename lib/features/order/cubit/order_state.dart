part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class MakeOrderLoadingState extends OrderState {}

class MakeOrderSuccessState extends OrderState {}

class MakeOrderErrorState extends OrderState {
  final String error;

  MakeOrderErrorState({required this.error});
}

class GetOrderDataLoadingState extends OrderState {}

class GetOrderDataSuccessState extends OrderState {}

class GetOrderDataErrorState extends OrderState {}

class GetMyOrderDataLoadingState extends OrderState {}

class GetMyOrderDataSuccessState extends OrderState {
  final OrderModel orderModel;
  final int length;

  GetMyOrderDataSuccessState({required this.orderModel, required this.length});
}

class GetMyOrderDataErrorState extends OrderState {
  final String error;

  GetMyOrderDataErrorState({required this.error});
}
