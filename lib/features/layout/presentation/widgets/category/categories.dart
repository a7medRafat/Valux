import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/utils/loading.dart';
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
              Text('Categories', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if(state is GetCategoriesLoadingStates){
                      return const Loading();
                    }
                    return ListView.separated(
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
                            const SizedBox(width: 10),
                        itemCount: sl<CategoryCubit>()
                            .categoriesModel!
                            .data!
                            .data!
                            .length);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
