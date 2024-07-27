import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/extensions/navigation.dart';
import 'package:valux/features/order/presentation/screens/order_screen.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/shared_widgets/app_button.dart';
import '../../../../core/utils/dialog.dart';
import '../../../address/cubit/address_cubit.dart';
import '../../../address/presentation/screens/address_screen.dart';
import '../../../address/presentation/widgets/addresses.dart';

class OrderBtn extends StatelessWidget {
  const OrderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return AppButton(
          width: 90.w,
          function: () {
            sl<AddressCubit>().addressModel!.data!.data!.isNotEmpty
                ? MyDialog.show(
                    context: context,
                    thisFun: () {
                      if (sl<AddressCubit>().selected != -1) {
                        context.go(
                          page: OrderScreen(
                              addressMap: false,
                              selected: sl<AddressCubit>().selected),
                        );
                      }
                    },
                    addFun: () => context.go(page: const AddressScreen()),
                    content: const Addresses())
                : context.go(page: const AddressScreen());
          },
          text: 'order',
          txtColor: AppColors.vWhite,
          radius: BorderRadius.circular(3),
          btnColor: AppColors.primaryColor,
        );
      },
    );
  }
}
