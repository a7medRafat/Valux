import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/cart/presentation/widgets/cart_item.dart';
import 'package:valux/features/order/presentation/screens/order_screen.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/go/go.dart';
import '../../../../core/utils/app_button.dart';
import '../../../../core/utils/dialog.dart';
import '../../../../core/utils/titles.dart';
import '../../../address/cubit/address_cubit.dart';
import '../../../address/presentation/screens/address_screen.dart';
import '../../../address/presentation/widgets/addresses.dart';

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
            return const Center(child: Loading());
          } else if (state is GetCartsErrorState) {
            return MyToast.show(text: state.error, context: context);
          }
          if (state is GetCartsSuccessState) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CartItem(
                              product: state
                                  .cartModel.data!.cartItems![index].product!,
                              index: index);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: state.cartModel.data!.cartItems!.length),
                  ),
                ],
              ),
            );
          }
          return const Loading();
        },
      ),
      floatingActionButton: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          return AppButton(
            width: 70.w,
            function: ()async {

              sl<AddressCubit>().getAddress();
              sl<AddressCubit>().addressModel!.data!.data!.isNotEmpty
                  ? MyDialog.show(
                      context: context,
                      thisFun: () {
                        if (sl<AddressCubit>().selected != -1) {
                          Go.goTo(
                              context, const OrderScreen(addressMap: false));
                        }
                      },
                      addFun: () => Go.goTo(context, const AddressScreen()),
                      content: const Addresses())
                  : Go.goTo(context, const AddressScreen());
            },
            text: 'order',
            txtColor: AppColors.vWhite,
            radius: BorderRadius.circular(5),
            btnColor: AppColors.vBlue.withOpacity(0.7),
          );
        },
      ),
    );
  }
}
