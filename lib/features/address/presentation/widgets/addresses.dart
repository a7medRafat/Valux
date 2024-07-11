import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/shared_widgets/loading.dart';
import 'package:valux/core/shared_widgets/toast.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import '../../../../App/injuctoin_container.dart';

class Addresses extends StatefulWidget {
  const Addresses({super.key});

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      buildWhen: (previous, current) => current is GetAddressSuccessState,
      builder: (context, state) {
        if (state is GetAddressLoadingState) {
          return const Center(child: Loading());
        }
        if (state is GetAddressErrorState ||
            sl<AddressCubit>().addressModel!.data!.data!.isEmpty) {
          return MyToast.show(text: 'No Address', context: context);
        } else {
          return VContainer(
            height: 300.0.h,
            width: 300.0.w,
            color: Colors.white,
            child: ListView.separated(
                itemBuilder: (context, index) => addressContent(
                      index,
                      sl<AddressCubit>().addressModel!.data!.data![index].city!,
                      sl<AddressCubit>()
                          .addressModel!
                          .data!
                          .data![index]
                          .region!,
                      sl<AddressCubit>()
                          .addressModel!
                          .data!
                          .data![index]
                          .details!,
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: sl<AddressCubit>().addressModel!.data!.data!.length),
          );
        }
      },
    );
  }

  addressContent(int index, String city, String regan, String details) =>
      VContainer(
        padding: const EdgeInsets.all(5),
        color: index == sl<AddressCubit>().selected
            ? AppColors.vBlue.withOpacity(0.6)
            : AppColors.scaffoldColor,
        function: () {
          setState(() {
            sl<AddressCubit>().selected = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(city, style: AppFonts.bodyText3),
              const Text(' , '),
              Text(regan, style: AppFonts.bodyText3),
              const Text(' , '),
              Expanded(
                child: Text(details, maxLines: 1, style: AppFonts.bodyText3),
              ),
            ],
          ),
        ),
      );
}
