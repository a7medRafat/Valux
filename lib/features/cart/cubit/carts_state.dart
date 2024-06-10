part of 'carts_cubit.dart';

@immutable
abstract class CartsState {}

class CartsInitial extends CartsState {}

class GetCartsLoadingState extends CartsState {}
class GetCartsErrorState extends CartsState {
  final String error;

  GetCartsErrorState({required this.error});
}
class GetCartsSuccessState extends CartsState {
  final CartModel cartModel;

  GetCartsSuccessState({required this.cartModel});
}


class AddSuccessState extends CartsState {}

class MinusSuccessState extends CartsState {}

class SubTotalSuccessState extends CartsState {}
