import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/ani_loading.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../widgets/my_orders/my_order_head.dart';
import '../widgets/my_orders/my_order_item.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    sl<OrderCubit>().getMyOrders();
    super.initState();
  }

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
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => MyOrderItem(
                            model: state.orderModel,
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.h),
                      itemCount: state.length),
                ],
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
