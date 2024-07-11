import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/shared_widgets/ani_loading.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import 'package:valux/features/order/presentation/widgets/confirmation/confirm_head.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../cart/cubit/carts_cubit.dart';
import '../widgets/confirmation/confirm_listview.dart';
import '../widgets/confirmation/confirm_order_btn.dart';
import '../widgets/confirmation/shopping_addresss.dart';
import '../widgets/confirmation/summary.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen(
      {super.key, required this.addressMap, required this.selected});

  final bool addressMap;
  final int selected;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    sl<AddressCubit>().getAddress();
    sl<CartsCubit>().sum = 0;
    sl<CartsCubit>().getTotalPrice();
    if (sl<AddressCubit>().selected != -1) {
      sl<AddressCubit>().getSelectedAddress();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is GetAddressLoadingState) {
                return Center(
                  child: AnimationLoading(
                    width: 40.w,
                    height: 40.h,
                  ),
                );
              }
              return Column(
                children: [
                  const ConfirmHead(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ShoppingAddress(selected: widget.selected),
                      const Summary(),
                    ],
                  ),
                  const ConfirmListView(),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: ConfirmOrderBtn(addressMap: widget.addressMap));
  }
}
