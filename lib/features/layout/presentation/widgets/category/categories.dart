import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/Strings/app_strings.dart';
import 'package:valux/config/style/app_fonts.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../cubit/category/category_cubit.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.categories, style:AppFonts.bodyText1),
              SizedBox(height: 10.h),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryItem(
                          name: sl<CategoryCubit>()
                              .categoriesModel!
                              .data!
                              .data![index]
                              .name!,
                          index: index,
                          id: sl<CategoryCubit>()
                              .categoriesModel!
                              .data!
                              .data![index]
                              .id!,
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 10.w),
                    itemCount: sl<CategoryCubit>()
                        .categoriesModel!
                        .data!
                        .data!
                        .length),
              )
            ],
          ),
        );
      },
    );
  }
}
