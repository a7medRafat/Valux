import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/utils/vContainer.dart';

class DetailsHead extends StatelessWidget {
  const DetailsHead({super.key, required this.img, required this.discount});

  final String img;
  final dynamic discount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            VContainer(
              color: AppColors.vWhite,
              height: MediaQuery.of(context).size.height / 2.3,
              child: Center(
                child: Image.network(height: 150.h, width: 150.w, img),
              ),
            ),
            if (discount != 0)
              VContainer(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.black,
                child: Text(
                  'Discount',
                  style: AppFonts.lightBold.copyWith(fontSize: 11.sp),
                ),
              ),
          ],
        );
      },
    );
  }
}
