import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/cart/presentation/widgets/cart_item.dart';
import 'package:valux/features/cart/presentation/widgets/order_btn.dart';
import '../../../../core/utils/ani_loading.dart';
import '../../../../core/utils/titles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Titles(text: 'Cart')),
      body: BlocBuilder<CartsCubit, CartsState>(
        buildWhen: (previous, current) => current is GetCartsSuccessState,
        builder: (context, state) {
          if (state is GetCartsLoadingState) {
            return const Center(child: AnimationLoading());
          } else if (state is GetCartsErrorState) {
            return MyToast.show(text: state.error, context: context);
          }
          if (state is GetCartsSuccessState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartItem(
                              product: state
                                  .cartModel.data!.cartItems![index].product!,
                              index: index);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: state.cartModel.data!.cartItems!.length),
                  ],
                ),
              ),
            );
          }
          return const Loading();
        },
      ),
      floatingActionButton: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          if (state is GetCartsSuccessState) {
            return const OrderBtn();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
