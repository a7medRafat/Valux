import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/colors/app_colors.dart';

class Images extends StatelessWidget {
  const Images({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 40.h,
        child: Center(
          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      customImage(images[index], index , context),
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: images.length);
            },
          ),
        ),
      ),
    );
  }

  Widget customImage(img, index, context) => GestureDetector(
        onTap: () => sl<DetailsCubit>().changeSelectedImg(index),
        child: VContainer(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          height: 40.h,
          width: 40.w,
          borderRadius: BorderRadius.circular(5),
          border: sl<DetailsCubit>().selectedImg == index
              ? Border.all(color: AppColors.vBlue, width: 3)
              : Border.all(color: Colors.black54, width: 1),
          child: Image.network(
            img,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            errorBuilder: (context, exception, stackTrace) {
              return const Icon(Icons.error_outline);
            },
          ),
        ),
      );
}
