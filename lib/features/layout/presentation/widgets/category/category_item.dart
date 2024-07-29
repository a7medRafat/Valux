import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../cubit/category/category_cubit.dart';
import '../../../cubit/home/home_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.index,
    required this.id,
  });

  final String name;
  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      child: VContainer(
        color: sl<CategoryCubit>().selectedCategory == index
            ? Colors.blue
            : Colors.white,
        function: () {
          context.read<CategoryCubit>().changeCategory(index);
          context.read<HomeCubit>().getCategoryProducts(categoryId: id);
        },
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Center(
          child: Text(
            name,
            style: AppFonts.regular2.copyWith(
              fontSize: 13.sp,
              color: sl<CategoryCubit>().selectedCategory == index
                  ? Colors.white
                  : AppColors.body,
            ),
          ),
        ),
      ),
    );
  }
}
