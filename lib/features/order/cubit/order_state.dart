part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class MakeOrderLoadingState extends OrderState {}
class MakeOrderSuccessState extends OrderState {}
class MakeOrderErrorState extends OrderState {}
