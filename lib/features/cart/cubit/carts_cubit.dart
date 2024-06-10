import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../data/models/CartModel.dart';
import '../domain/usecases/get_carts_usecase.dart';

part 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  final GetCartsUseCase getCartsUseCase;

  CartsCubit({required this.getCartsUseCase}) : super(CartsInitial());

  final Map<int, dynamic> orders = {};

  static CartModel? cart;
  dynamic total = 0;
  dynamic sum;

  void getCarts() async {
    emit(GetCartsLoadingState());
    final failureOrSuccess = await getCartsUseCase.call();
    failureOrSuccess.fold((failure) {
      emit(GetCartsErrorState(error: failure.getMessage()));
    }, (success) {
      cart = success;
      sum = success.data!.total;
      for (var e in success.data!.cartItems!) {
        orders.addAll({e.id!: e.quantity});
        sum += e.product!.price * orders[e.id];
      }
      emit(GetCartsSuccessState(cartModel: success));
    });
  }

  dynamic totalPrice(int counter, dynamic price, index) {
    sum = price * counter;
    orders[cart!.data!.cartItems![index].id!] = counter;
    return sum;
  }

  dynamic getTotalPrice() {
    for (var e in cart!.data!.cartItems!) {
      sum += e.product!.price * orders[e.id];
    }
  }
}
