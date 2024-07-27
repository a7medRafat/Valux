import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/shared_widgets/ani_loading.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import '../widgets/my_orders/my_order_head.dart';
import '../widgets/my_orders/my_order_item.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is GetMyOrderDataLoadingState) {
            return const Center(child: AnimationLoading());
          }
          if (state is GetMyOrderDataErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is GetMyOrderDataSuccessState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const MyOrderHead(),
                  if (state.orders.isEmpty)
                    const Center(child: Text('No orders yet')),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          MyOrderItem(orders: state.orders, mainIndex: index),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.h),
                      itemCount: state.length),
                ],
              ),
            );
          }
          return const Center(child: AnimationLoading());
        },
      ),
    );
  }
}
