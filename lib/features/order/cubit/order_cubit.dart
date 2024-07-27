import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/order/data/models/TestOrder.dart';
import '../../../App/injuctoin_container.dart';
import '../../address/cubit/address_cubit.dart';
import '../../cart/cubit/carts_cubit.dart';
import 'package:intl/intl.dart';
import '../domain/usecases/get_my_orders_usecase.dart';
import '../domain/usecases/make_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final MakeOrderUseCase makeOrderUseCase;
  final GetMyOrdersUseCase getMyOrdersUseCase;

  OrderCubit({required this.makeOrderUseCase, required this.getMyOrdersUseCase})
      : super(OrderInitial());

  List<ProductOrder>? products = [];
  OrderModel? orderModel;

  Future<void> getOrderData({required bool addressMap}) async {
    products = [];
    Address address = Address(
      city: addressMap
          ? sl<AddressCubit>().addressModel!.data!.data!.first.city!
          : sl<AddressCubit>().selectedAddress!.city,
      region: addressMap
          ? sl<AddressCubit>().addressModel!.data!.data!.first.region!
          : sl<AddressCubit>().selectedAddress!.region,
      details: addressMap
          ? sl<AddressCubit>().addressModel!.data!.data!.first.details!
          : sl<AddressCubit>().selectedAddress!.details,
    );
    for (var e in CartsCubit.cart!.data!.cartItems!) {
      ProductOrder v = ProductOrder(
        name: e.product!.name!,
        image: e.product!.image!,
        quantity: sl<CartsCubit>().orders[e.id].toString(),
        price: e.product!.price!,
      );
      products!.add(v);
    }
    orderModel = OrderModel(
      id: UserData().getData(id: Keys.user)!.id,
      date: DateFormat("dd-MM-yyyy").format(DateTime.now()),
      name: UserData().getData(id: Keys.user)!.name,
      totalPrice: sl<CartsCubit>().sum,
      payment: 'paypal',
      address: address,
      product: products,
    );
  }

  void makeOrder({required bool addressMap}) async {
    emit(MakeOrderLoadingState());
    await getOrderData(addressMap: addressMap);
    final failureOrSuccess = await makeOrderUseCase.call(order: orderModel!);
    failureOrSuccess.fold(
        (failure) => emit(MakeOrderErrorState(error: failure.getMessage())),
        (success) {
      getMyOrders();
      emit(MakeOrderSuccessState());
    });
  }

  void getMyOrders() async {
    emit(GetMyOrderDataLoadingState());
    List<OrderModel> list = [];
    int? length;
    final failureOrSuccess = await getMyOrdersUseCase.call();
    failureOrSuccess.fold(
        (failure) =>
            emit(GetMyOrderDataErrorState(error: failure.getMessage())),
        (success) {
      length = success.docs.length;
      for (var e in success.docs) {
        list.add(OrderModel.fromJson(e.data()));
      }
      emit(GetMyOrderDataSuccessState(length: length!, orders: list));
    });
  }
}
