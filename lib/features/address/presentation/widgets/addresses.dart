import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
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
        if (state is GetAddressErrorState) {
          return MyToast.show(text: state.error, context: context);
        }
        if (state is GetAddressSuccessState) {
          return VContainer(
            height: 300.0,
            width: 300.0,
            color: Colors.white,
            child: ListView.separated(
                itemBuilder: (context, index) => addressContent(
                      index,
                      state.model.data!.data![index].city!,
                      state.model.data!.data![index].region!,
                      state.model.data!.data![index].details!,
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: state.model.data!.data!.length),
          );
        }
        return const Center(child: Text('no address'));
      },
    );
  }

  addressContent(int index, String city, String regan, String details) =>
      VContainer(
        padding: const EdgeInsets.all(5),
        color: index == sl<AddressCubit>().selected
            ? AppColors.vBlue.withOpacity(0.8)
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
              Text(city,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.body)),
              const Text(' , '),
              Text(regan,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.body)),
              const Text(' , '),
              Expanded(
                child: Text(details,
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12.sp,
                        color: AppColors.body)),
              ),
            ],
          ),
        ),
      );
}
