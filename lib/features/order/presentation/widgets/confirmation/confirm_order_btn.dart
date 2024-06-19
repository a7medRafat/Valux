import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/go/go.dart';
import '../../../../../core/utils/ani_loading.dart';
import '../../../../../core/utils/app_button.dart';
import '../../../../../core/utils/quick_alert.dart';
import '../../../../../core/utils/vContainer.dart';
import '../../../../layout/presentation/screens/app_layout.dart';
import '../../../cubit/order_cubit.dart';

class ConfirmOrderBtn extends StatelessWidget {
  const ConfirmOrderBtn({super.key, required this.addressMap});

  final bool addressMap;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      color: AppColors.confirmation,
      height: 50.h,
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) async {
          if (state is MakeOrderSuccessState) {
            MyQuickAlert.show(context);
            await Future.delayed(const Duration(milliseconds: 3000));
            Go.goAndFinish(context, const AppLayout());
          }
        },
        builder: (context, state) {
          if (state is MakeOrderLoadingState) {
            return Center(
                child: AnimationLoading(
                    color: Colors.white, height: 20.h, width: 20.w));
          }
          return AppButton(
            function: () {
              sl<OrderCubit>().makeOrder(addressMap: addressMap);
            },
            text: 'confirm',
            radius: BorderRadius.zero,
            btnColor: AppColors.confirmation,
            txtColor: AppColors.vWhite,
          );
        },
      ),
    );
  }
}
