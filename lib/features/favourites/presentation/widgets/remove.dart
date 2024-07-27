import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/layout/cubit/home/home_cubit.dart';
import '../../../../config/colors/app_colors.dart';

class RemoveFav extends StatelessWidget {
  const RemoveFav({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () =>
            context.read<HomeCubit>().addDeleteFav(productId: productId),
        child: Icon(
          Icons.close,
          color: AppColors.vGray,
          size: 15.sp,
        ),
      ),
    );
  }
}
