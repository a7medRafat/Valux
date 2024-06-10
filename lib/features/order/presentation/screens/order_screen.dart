import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/app_button.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import 'package:valux/features/order/presentation/widgets/confirmation/confirm_head.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../cart/cubit/carts_cubit.dart';
import '../widgets/confirmation/confirm_listview.dart';
import '../widgets/confirmation/shopping_addresss.dart';
import '../widgets/confirmation/summary.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.addressMap});
  final bool addressMap;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    sl<CartsCubit>().sum = 0;
    sl<CartsCubit>().getTotalPrice();
    sl<AddressCubit>().getSelectedAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        backColor: Colors.transparent,
          title: const Text(''),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ConfirmHead(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShoppingAddress(),
                Summary(),
              ],
            ),
            SizedBox(height: 20.h),
            const ConfirmListView(),
          ],
        ),
      ),
      bottomNavigationBar: VContainer(
        color: AppColors.confirmation,
        height: 70,
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is MakeOrderLoadingState) {
              return const Loading();
            }
            return AppButton(
              function: () {
                sl<OrderCubit>().makeOrder(addressMap: widget.addressMap);
              },
              text: 'confirm',
              radius: BorderRadius.zero,
              btnColor: AppColors.confirmation,
              txtColor: AppColors.vWhite,
            );
          },
        ),
      ),
    );
  }
}
