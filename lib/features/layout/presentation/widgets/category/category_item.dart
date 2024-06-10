import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/colors/app_colors.dart';
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
      child: GestureDetector(
        onTap: () {
          sl<CategoryCubit>().changeCategory(index);
          sl<HomeCubit>().getCategoryProducts(categoryId: id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: sl<CategoryCubit>().selectedCategory == index
                ? Colors.blue
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Center(
                child: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: sl<CategoryCubit>().selectedCategory == index
                        ? Colors.white
                        : AppColors.body,
                  ),
            )),
          ),
        ),
      ),
    );
  }
}
