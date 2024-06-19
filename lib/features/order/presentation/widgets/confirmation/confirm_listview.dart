import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import '../../../../../App/injuctoin_container.dart';
import 'listview_item.dart';

class ConfirmListView extends StatelessWidget {
  const ConfirmListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListViewItem(
                    img: CartsCubit.cart!.data!.cartItems![index].product!.image!,
                    quantity: sl<CartsCubit>().orders[CartsCubit.cart!.data!.cartItems![index].id].toString(),
                    name: CartsCubit.cart!.data!.cartItems![index].product!.name!,
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
              itemCount: CartsCubit.cart!.data!.cartItems!.length),
        );
      },
    );
  }
}
