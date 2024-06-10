import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/order/data/models/orderModel.dart';
import 'package:intl/intl.dart';
import '../../../App/injuctoin_container.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  OrderModel? orderModel;

  void makeOrder({required bool addressMap}) async {
    emit(MakeOrderLoadingState());
    for (var e in CartsCubit.cart!.data!.cartItems!) {
      orderModel = OrderModel(
          id: e.id,
          price: e.product!.price,
          quantity: sl<CartsCubit>().orders[e.id],
          image: e.product!.image,
          name: e.product!.name,
          city: addressMap
              ? sl<AddressCubit>().addressModel!.data!.data!.last.city!
              : sl<AddressCubit>().selectedAddress!.city,
          regan: addressMap
              ? sl<AddressCubit>().addressModel!.data!.data!.last.region!
              : sl<AddressCubit>().selectedAddress!.region,
          details: addressMap
              ? sl<AddressCubit>().addressModel!.data!.data!.last.details!
              : sl<AddressCubit>().selectedAddress!.details,
          date: DateFormat("dd-MM-yyyy").format(DateTime.now()),
          totalPrice: sl<CartsCubit>().sum,
          payment: 'paypal');
    }
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(UserData().getData(id: Keys.user)!.id.toString())
          .collection('order')
          .add(orderModel!.toJson());
      emit(MakeOrderSuccessState());
    } catch (e) {
      print(e.toString());
      emit(MakeOrderErrorState());
    }
  }
}
